# Credit Notes System - Implementation Checklist

## 📋 Pre-Deployment Checklist

### Database Setup
- [ ] Execute `DatabaseManagement/create-creditnotes-table.sql`
- [ ] Verify `CreditNotes` table created successfully
- [ ] Verify `Sales` table updated with new columns
- [ ] Verify all indexes created
- [ ] Test database constraints (foreign keys, check constraints)

### Code Compilation
- [ ] Run `dotnet build` - No errors
- [ ] Run `dotnet build` - No warnings (or acceptable warnings only)
- [ ] All new files included in project
- [ ] All dependencies resolved

### API Testing - Credit Notes CRUD
- [ ] POST `/api/CreditNotes` - Create credit note
- [ ] GET `/api/CreditNotes` - Get all credit notes
- [ ] GET `/api/CreditNotes/{id}` - Get by ID
- [ ] PATCH `/api/CreditNotes/{id}` - Update credit note
- [ ] DELETE `/api/CreditNotes/{id}` - Delete pending credit note
- [ ] GET `/api/CreditNotes?status=pending` - Filter by status
- [ ] GET `/api/CreditNotes?search=CN-2026` - Search functionality

### API Testing - Credit Note Actions
- [ ] POST `/api/CreditNotes/{id}/approve` - Approve credit note
- [ ] POST `/api/CreditNotes/{id}/reject` - Reject credit note
- [ ] POST `/api/CreditNotes/{id}/upload` - Upload PDF document
- [ ] GET `/api/CreditNotes/{id}/download` - Download document
- [ ] GET `/api/CreditNotes/invoice/{invoiceId}` - Get by invoice

### API Testing - Sales Integration
- [ ] GET `/api/Sales/Credited` - Get credited sales
- [ ] GET `/api/Sales/Credited?status=approved` - Filter credited sales
- [ ] Verify sales return credit notes in response

### Business Logic Validation
- [ ] Credit note number auto-generates (CN-YYYY-XXX format)
- [ ] Invoice data auto-populates from sale
- [ ] Credit amount validation (cannot exceed original)
- [ ] Total credits validation (sum cannot exceed original)
- [ ] Status transition validation works
- [ ] Can only delete pending credit notes
- [ ] Can only approve/reject pending credit notes

### Stock Reversal Testing
- [ ] Create credit note with `reverseStock = true`
- [ ] Note current inventory quantities
- [ ] Approve credit note
- [ ] Verify inventory quantities increased correctly
- [ ] Verify all sale items processed
- [ ] Test with multiple items in sale

### Sale Reversal Testing
- [ ] Create credit note with `reverseSale = true`
- [ ] Approve credit note
- [ ] Verify sale.HasCreditNote = true
- [ ] Verify sale.CreditedAmount updated
- [ ] Test partial credit (amount < total)
- [ ] Test full credit (amount = total)

### File Upload Testing
- [ ] Upload PDF file < 5MB - Success
- [ ] Upload PDF file > 5MB - Rejected
- [ ] Upload non-PDF file - Rejected
- [ ] Upload with no file - Rejected
- [ ] Verify file saved to correct location
- [ ] Download uploaded file - Success
- [ ] Verify filename format (CreditNoteNumber.pdf)

### Error Handling
- [ ] Create credit note with invalid invoice ID - 400 error
- [ ] Get non-existent credit note - 404 error
- [ ] Update with invalid status transition - 400 error
- [ ] Delete approved credit note - 400 error
- [ ] Approve already approved credit note - 400 error

### Data Integrity
- [ ] Soft delete works (IsDeleted flag)
- [ ] Deleted credit notes don't appear in queries
- [ ] Audit fields populated (CreatedBy, CreatedDate, etc.)
- [ ] Foreign key constraints enforced
- [ ] Unique constraint on CreditNoteNumber enforced

### AutoMapper Configuration
- [ ] CreditNote → CreditNoteViewModel mapping works
- [ ] CreditNote → CreditNoteSummaryViewModel mapping works
- [ ] CreateCreditNoteDto → CreditNote mapping works
- [ ] Sale → SaleViewModel includes credit notes
- [ ] Document information maps correctly

### Dependency Injection
- [ ] ICreditNoteService registered
- [ ] ICreditNoteRepository registered
- [ ] Services resolve correctly
- [ ] No circular dependencies

### Performance
- [ ] Queries use indexes (check execution plans)
- [ ] Large result sets perform acceptably
- [ ] File upload/download is responsive
- [ ] No N+1 query issues

### Security
- [ ] File upload validates file type server-side
- [ ] File upload validates file size
- [ ] File paths sanitized
- [ ] No SQL injection vulnerabilities
- [ ] Authorization ready (uncomment [Authorize] when needed)

---

## 🎯 Frontend Integration Checklist

### API Service Updates
- [ ] Update `sales-api.service.ts` with real endpoints
- [ ] Remove all mock data
- [ ] Test all service methods

### Component Updates
- [ ] `credit-notes.component.ts` - Remove mock methods
- [ ] `list-sales.component.ts` - Remove mock filter
- [ ] Test credit note creation flow
- [ ] Test credit note editing flow
- [ ] Test document upload flow

### UI Testing
- [ ] Create credit note form works
- [ ] Invoice search/selection works
- [ ] Auto-fill functionality works
- [ ] Document upload works
- [ ] Approve/reject buttons work
- [ ] Credited sales view works
- [ ] Filtering and searching works

---

## 📊 Production Readiness Checklist

### Configuration
- [ ] Update connection string for production database
- [ ] Configure file storage location (local/cloud)
- [ ] Set up HTTPS/SSL
- [ ] Configure CORS if needed
- [ ] Set up environment-specific settings

### Logging
- [ ] Add logging for credit note operations
- [ ] Log approval/rejection actions
- [ ] Log file uploads
- [ ] Log stock reversals
- [ ] Log errors and exceptions

### Monitoring
- [ ] Set up health checks
- [ ] Monitor file storage usage
- [ ] Monitor API performance
- [ ] Set up alerts for errors

### Documentation
- [ ] API documentation in Swagger
- [ ] User documentation created
- [ ] Admin guide for approvals
- [ ] Troubleshooting guide

### Backup & Recovery
- [ ] Database backup strategy
- [ ] File storage backup strategy
- [ ] Disaster recovery plan
- [ ] Test restore procedures

### Training
- [ ] Train users on credit note creation
- [ ] Train admins on approval process
- [ ] Document common scenarios
- [ ] Create video tutorials (optional)

---

## 🚀 Go-Live Checklist

### Final Verification
- [ ] All tests passed
- [ ] No critical bugs
- [ ] Performance acceptable
- [ ] Security reviewed
- [ ] Documentation complete

### Deployment
- [ ] Database migration executed in production
- [ ] Application deployed
- [ ] Configuration verified
- [ ] File storage accessible
- [ ] HTTPS working

### Post-Deployment
- [ ] Smoke tests passed
- [ ] Monitor for errors
- [ ] User feedback collected
- [ ] Performance monitoring active

### Rollback Plan
- [ ] Rollback procedure documented
- [ ] Backup verified
- [ ] Database rollback script ready
- [ ] Team notified of rollback procedures

---

## 📝 Notes

### Known Limitations
- None identified

### Future Enhancements
- Email notifications on approval
- Batch credit note processing
- Advanced reporting
- Export to PDF/Excel
- Audit log viewer

### Dependencies
- .NET 6+
- SQL Server
- Entity Framework Core
- AutoMapper
- Swagger/OpenAPI

---

## ✅ Sign-Off

### Development Team
- [ ] Code review completed
- [ ] Unit tests written (if applicable)
- [ ] Integration tests passed
- [ ] Documentation updated

### QA Team
- [ ] All test cases passed
- [ ] Edge cases tested
- [ ] Performance tested
- [ ] Security tested

### Product Owner
- [ ] Requirements met
- [ ] User stories completed
- [ ] Acceptance criteria satisfied
- [ ] Ready for deployment

---

**Checklist Version:** 1.0  
**Last Updated:** January 16, 2026  
**Project:** NCD-API Credit Notes System
