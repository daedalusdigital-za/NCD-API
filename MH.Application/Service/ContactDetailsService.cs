using AutoMapper;
using MH.Application.IService;
using MH.Domain.DBModel;
using MH.Domain.IRepository;
using MH.Domain.Model;
using MH.Domain.UnitOfWork;
using MH.Domain.ViewModel;
using MH.Application.Exception;

namespace MH.Application.Service
{
    public class ContactDetailsService : IContactDetailsService
    {
        private readonly IUserProfileRepository _userProfileRepository;
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public ContactDetailsService(IMapper mapper, IUnitOfWork unitOfWork, IUserProfileRepository userProfileRepository)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
            _userProfileRepository = userProfileRepository;
        }
        public async Task Add(ContactDetailsModel contactDetails)
        {
            var userProfile = await _userProfileRepository.FindBy(x => x.UserId == contactDetails.Userid);
            if(userProfile != null) 
            {
                var data = _mapper.Map<ContactDetails>(contactDetails);
                data.UserProfileId = userProfile.Id;
                await _unitOfWork.ContactDetailsRepository.Insert(data);
                await _unitOfWork.CommitAsync();
            }
            else throw new RecordNotFound("User id not found");
        }

        public async Task<List<ContactDetailsViewModel>> GetAll()
        {
            var data = await _unitOfWork.ContactDetailsRepository.GetAll(x => !x.IsDeleted,
                include => include.UserProfile,
                include => include.ContactDataType,
                include => include.ContactType,
                include => include.ContactEntity);
            var result = _mapper.Map<List<ContactDetailsViewModel>>(data);
            return result.OrderByDescending(x=> x.DateCreated).ToList();
        }

        public async Task<ContactDetailsViewModel> GetByUserId(int userId)
        {
            var data = await _unitOfWork.ContactDetailsRepository.FindBy(
                x => !x.IsDeleted && x.UserProfile.UserId == userId,
                include=> include.UserProfile, 
                include => include.ContactDataType, 
                include => include.ContactType, 
                include => include.ContactEntity
                );
            if(data != null)
            {
                var result = _mapper.Map<ContactDetailsViewModel>(data);
                return result;
            }
            else throw new RecordNotFound("User id not found");
        }

        public async Task Update(ContactDetailsModel contactDetails)
        {
            var existingData = await _unitOfWork.ContactDetailsRepository.FindBy(x => x.UserProfile.UserId == contactDetails.Userid && !x.IsDeleted, y=> y.UserProfile);
            if(existingData != null)
            {
                existingData.Name = contactDetails.Name;
                existingData.ContactTypeId = contactDetails.ContactTypeId;
                existingData.ContactDataTypeId = contactDetails.ContactDataTypeId;
                existingData.ContactEntityId = contactDetails.ContactEntityId;
                existingData.Data = contactDetails.Data;
                
                await _unitOfWork.ContactDetailsRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
            else throw new RecordNotFound("User id not found");
        }

        public async Task Delete(int id)
        {
            var existingData = await _unitOfWork.ContactDetailsRepository.FindBy(x => x.Id == id && !x.IsDeleted);
            if(existingData != null)
            {
                existingData.IsDeleted = true;
                await _unitOfWork.ContactDetailsRepository.Update(existingData);
                await _unitOfWork.CommitAsync();
            }
        }  
    }
}
