using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveSaleUnwantedColumns : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Clinics_Districts_DistrictId",
                table: "Clinics");

            migrationBuilder.DropForeignKey(
                name: "FK_Sale_Provinces_ProvinceId",
                table: "Sale");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_CreatedByUserId",
                table: "TrainingSession");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_UpdateByUserId",
                table: "TrainingSession");

            migrationBuilder.DropTable(
                name: "Appointment");

            migrationBuilder.DropTable(
                name: "Hospitals");

            migrationBuilder.DropTable(
                name: "MedicalHistory");

            migrationBuilder.DropTable(
                name: "Otp");

            migrationBuilder.DropTable(
                name: "TicketDetails");

            migrationBuilder.DropTable(
                name: "Districts");

            migrationBuilder.DropTable(
                name: "Issue");

            migrationBuilder.DropTable(
                name: "TicketStatus");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_CreatedByUserId",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_UpdateByUserId",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_Sale_ProvinceId",
                table: "Sale");

            migrationBuilder.DropIndex(
                name: "IX_Clinics_DistrictId",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "CreatedByUserId",
                table: "TrainingSession");

            migrationBuilder.DropColumn(
                name: "UpdateByUserId",
                table: "TrainingSession");

            migrationBuilder.DropColumn(
                name: "CustomerEmail",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "CustomerId",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "DeliveryStatus",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "Discount",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "PaymentMethod",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "PaymentStatus",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "ProvinceId",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "Subtotal",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "TaxAmount",
                table: "Sale");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "TrainingSession",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "TrainingSession",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Trainers",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Sale",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_CreatedBy",
                table: "TrainingSession",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_UpdatedBy",
                table: "TrainingSession",
                column: "UpdatedBy");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_AspNetUsers_CreatedBy",
                table: "TrainingSession",
                column: "CreatedBy",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_AspNetUsers_UpdatedBy",
                table: "TrainingSession",
                column: "UpdatedBy",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_CreatedBy",
                table: "TrainingSession");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_UpdatedBy",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_CreatedBy",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_UpdatedBy",
                table: "TrainingSession");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "TrainingSession",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "TrainingSession",
                type: "datetime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<int>(
                name: "CreatedByUserId",
                table: "TrainingSession",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UpdateByUserId",
                table: "TrainingSession",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Trainers",
                type: "datetime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Sale",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CustomerEmail",
                table: "Sale",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CustomerId",
                table: "Sale",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "DeliveryStatus",
                table: "Sale",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<decimal>(
                name: "Discount",
                table: "Sale",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<int>(
                name: "PaymentMethod",
                table: "Sale",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "PaymentStatus",
                table: "Sale",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "ProvinceId",
                table: "Sale",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Subtotal",
                table: "Sale",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "TaxAmount",
                table: "Sale",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.CreateTable(
                name: "Appointment",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    PatientId = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    DateOfAppointment = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Appointment", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Appointment_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Appointment_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Appointment_Patient_PatientId",
                        column: x => x.PatientId,
                        principalTable: "Patient",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Districts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    ProvinceId = table.Column<int>(type: "int", nullable: false),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Districts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Districts_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Districts_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Districts_Provinces_ProvinceId",
                        column: x => x.ProvinceId,
                        principalTable: "Provinces",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Issue",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Issue", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "MedicalHistory",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    PatientId = table.Column<int>(type: "int", nullable: false),
                    RecordedBy = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    AtInstitution = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    BloodPressure = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime", nullable: false),
                    Glucose = table.Column<double>(type: "float", nullable: true),
                    HBA1C = table.Column<double>(type: "float", maxLength: 250, nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    IsMedicated = table.Column<bool>(type: "bit", nullable: true),
                    KeyTone = table.Column<double>(type: "float", nullable: true),
                    Lactate = table.Column<double>(type: "float", nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    NextAppointmentDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Perscription = table.Column<byte[]>(type: "varbinary(max)", nullable: true),
                    Recomendations = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Remidies = table.Column<int>(type: "int", nullable: true),
                    TotalColestorl = table.Column<double>(type: "float", nullable: true),
                    UricAcid = table.Column<double>(type: "float", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MedicalHistory", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MedicalHistory_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MedicalHistory_AspNetUsers_RecordedBy",
                        column: x => x.RecordedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MedicalHistory_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MedicalHistory_Patient_PatientId",
                        column: x => x.PatientId,
                        principalTable: "Patient",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Otp",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Code = table.Column<int>(type: "int", maxLength: 100, nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    MobileNo = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Otp", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TicketStatus",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TicketStatus", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Hospitals",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    DistrictId = table.Column<int>(type: "int", nullable: true),
                    ProvinceId = table.Column<int>(type: "int", nullable: false),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Capacity = table.Column<int>(type: "int", nullable: true),
                    Code = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ContactNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime", nullable: true),
                    Level = table.Column<int>(type: "int", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Services = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hospitals", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Hospitals_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Hospitals_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Hospitals_Districts_DistrictId",
                        column: x => x.DistrictId,
                        principalTable: "Districts",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Hospitals_Provinces_ProvinceId",
                        column: x => x.ProvinceId,
                        principalTable: "Provinces",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TicketDetails",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    IssueId = table.Column<int>(type: "int", nullable: false),
                    PriorityId = table.Column<int>(type: "int", nullable: false),
                    StatusId = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Subject = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TicketDetails", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TicketDetails_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TicketDetails_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TicketDetails_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TicketDetails_Issue_IssueId",
                        column: x => x.IssueId,
                        principalTable: "Issue",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TicketDetails_Priority_PriorityId",
                        column: x => x.PriorityId,
                        principalTable: "Priority",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TicketDetails_TicketStatus_StatusId",
                        column: x => x.StatusId,
                        principalTable: "TicketStatus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_CreatedByUserId",
                table: "TrainingSession",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_UpdateByUserId",
                table: "TrainingSession",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Sale_ProvinceId",
                table: "Sale",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_Clinics_DistrictId",
                table: "Clinics",
                column: "DistrictId");

            migrationBuilder.CreateIndex(
                name: "IX_Appointment_CreatedBy",
                table: "Appointment",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_Appointment_PatientId",
                table: "Appointment",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_Appointment_UpdatedBy",
                table: "Appointment",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_Districts_CreatedByUserId",
                table: "Districts",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Districts_ProvinceId",
                table: "Districts",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_Districts_UpdateByUserId",
                table: "Districts",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Hospitals_CreatedByUserId",
                table: "Hospitals",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Hospitals_DistrictId",
                table: "Hospitals",
                column: "DistrictId");

            migrationBuilder.CreateIndex(
                name: "IX_Hospitals_ProvinceId",
                table: "Hospitals",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_Hospitals_UpdateByUserId",
                table: "Hospitals",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistory_CreatedBy",
                table: "MedicalHistory",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistory_PatientId",
                table: "MedicalHistory",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistory_RecordedBy",
                table: "MedicalHistory",
                column: "RecordedBy");

            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistory_UpdatedBy",
                table: "MedicalHistory",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_CreatedBy",
                table: "TicketDetails",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_IssueId",
                table: "TicketDetails",
                column: "IssueId");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails",
                column: "PriorityId");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_UpdatedBy",
                table: "TicketDetails",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_UserId",
                table: "TicketDetails",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Clinics_Districts_DistrictId",
                table: "Clinics",
                column: "DistrictId",
                principalTable: "Districts",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Sale_Provinces_ProvinceId",
                table: "Sale",
                column: "ProvinceId",
                principalTable: "Provinces",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_AspNetUsers_CreatedByUserId",
                table: "TrainingSession",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_AspNetUsers_UpdateByUserId",
                table: "TrainingSession",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
