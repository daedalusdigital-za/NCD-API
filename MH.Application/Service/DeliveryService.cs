using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IEntity;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.ViewModel;

namespace MH.Application.Service
{
    public class DeliveryService : IDeliveryService
    {
        private readonly IDeliveryRepository _deliveryRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUser _currentUser;

        public DeliveryService(
            IDeliveryRepository deliveryRepository,
            IMapper mapper,
            ICurrentUser currentUser)
        {
            _deliveryRepository = deliveryRepository;
            _mapper = mapper;
            _currentUser = currentUser;
        }

        public async Task Add(DeliveryModel model)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(model.InstitutionName))
                throw new ArgumentException("Institution name is required");

            if (string.IsNullOrWhiteSpace(model.Province))
                throw new ArgumentException("Province is required");

            if (string.IsNullOrWhiteSpace(model.ItemDescription))
                throw new ArgumentException("Item description is required");

            if (model.Quantity <= 0)
                throw new ArgumentException("Quantity must be greater than 0");

            // Generate delivery number if not provided
            if (string.IsNullOrEmpty(model.DeliveryNumber))
            {
                model.DeliveryNumber = await GenerateDeliveryNumber();
            }

            var entity = _mapper.Map<Delivery>(model);
            entity.CreatedBy = _currentUser.User.Id;
            entity.DateCreated = DateTime.Now;
            entity.IsDeleted = false;

            await _deliveryRepository.Insert(entity);
            await _deliveryRepository.SaveAsync();
        }

        public async Task Update(DeliveryModel model)
        {
            if (!model.Id.HasValue || model.Id.Value <= 0)
                throw new ArgumentException("Invalid delivery ID");

            var existingEntity = await _deliveryRepository.FindByAsTracking(x => x.Id == model.Id.Value);
                
            if (existingEntity == null)
                throw new ArgumentException($"Delivery with ID {model.Id.Value} not found");

            // Update fields
            existingEntity.SaleId = model.SaleId;
            existingEntity.InstitutionName = model.InstitutionName;
            existingEntity.Province = model.Province;
            existingEntity.ItemDescription = model.ItemDescription;
            existingEntity.Quantity = model.Quantity;
            existingEntity.DeliveryDate = model.DeliveryDate;
            existingEntity.InvoiceNumber = model.InvoiceNumber;
            existingEntity.Status = model.Status;
            existingEntity.DriverName = model.DriverName;
            existingEntity.VehicleNumber = model.VehicleNumber;
            existingEntity.RecipientName = model.RecipientName;
            existingEntity.RecipientSignature = model.RecipientSignature;
            existingEntity.ReceivedDate = model.ReceivedDate;
            existingEntity.Notes = model.Notes;

            // Update audit fields
            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;

            await _deliveryRepository.Update(existingEntity);
            await _deliveryRepository.SaveAsync();
        }

        public async Task UpdateStatus(DeliveryStatusUpdateModel model)
        {
            var existingEntity = await _deliveryRepository.FindByAsTracking(x => x.Id == model.DeliveryId);
                
            if (existingEntity == null)
                throw new ArgumentException($"Delivery with ID {model.DeliveryId} not found");

            existingEntity.Status = model.Status;
            existingEntity.RecipientName = model.RecipientName ?? existingEntity.RecipientName;
            existingEntity.RecipientSignature = model.RecipientSignature ?? existingEntity.RecipientSignature;
            existingEntity.ReceivedDate = model.ReceivedDate ?? existingEntity.ReceivedDate;
            existingEntity.Notes = model.Notes ?? existingEntity.Notes;

            // If status is Delivered and ReceivedDate not set, set it now
            if (model.Status == DeliveryTrackingStatus.Delivered && !existingEntity.ReceivedDate.HasValue)
            {
                existingEntity.ReceivedDate = DateTime.Now;
            }

            existingEntity.UpdatedBy = _currentUser.User.Id;
            existingEntity.LastUpdated = DateTime.Now;

            await _deliveryRepository.Update(existingEntity);
            await _deliveryRepository.SaveAsync();
        }

        public async Task Delete(int id)
        {
            var entity = await _deliveryRepository.FindByAsTracking(x => x.Id == id);
            
            if (entity == null)
                throw new ArgumentException($"Delivery with ID {id} not found");

            // Soft delete
            entity.IsDeleted = true;
            entity.UpdatedBy = _currentUser.User.Id;
            entity.LastUpdated = DateTime.Now;

            await _deliveryRepository.Update(entity);
            await _deliveryRepository.SaveAsync();
        }

        public async Task<DeliveryViewModel?> GetById(int id)
        {
            var entity = await _deliveryRepository.FindBy(
                x => x.Id == id && !x.IsDeleted,
                x => x.Sale!);
            
            return entity == null ? null : _mapper.Map<DeliveryViewModel>(entity);
        }

        public async Task<List<DeliveryViewModel>> GetAll()
        {
            var entities = await _deliveryRepository.GetAll(
                x => !x.IsDeleted,
                x => x.Sale!);
            
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<List<DeliveryViewModel>> GetBySaleId(int saleId)
        {
            var entities = await _deliveryRepository.GetBySaleId(saleId);
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<List<DeliveryViewModel>> GetByProvince(string province)
        {
            var entities = await _deliveryRepository.GetByProvince(province);
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<List<DeliveryViewModel>> GetByStatus(DeliveryTrackingStatus status)
        {
            var entities = await _deliveryRepository.GetByStatus(status);
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<List<DeliveryViewModel>> GetByDateRange(DateTime startDate, DateTime endDate)
        {
            var entities = await _deliveryRepository.GetByDateRange(startDate, endDate);
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<List<DeliveryViewModel>> GetByEquipmentType(string itemDescription)
        {
            var entities = await _deliveryRepository.GetByEquipmentType(itemDescription);
            return _mapper.Map<List<DeliveryViewModel>>(entities);
        }

        public async Task<DeliveryStatsModel> GetDeliveryStats()
        {
            return await _deliveryRepository.GetDeliveryStats();
        }

        public async Task<List<DeliveryByEquipmentTypeModel>> GetDeliveryStatsByEquipmentType()
        {
            return await _deliveryRepository.GetDeliveryStatsByEquipmentType();
        }

        public async Task<List<DeliveryByProvinceModel>> GetDeliveryStatsByProvince()
        {
            return await _deliveryRepository.GetDeliveryStatsByProvince();
        }

        public async Task<string> GenerateDeliveryNumber()
        {
            var count = await _deliveryRepository.Count(x => true);
            var number = count + 1;
            return $"DEL{number:D6}";
        }
    }
}
