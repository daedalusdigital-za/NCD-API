using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateTrainerAndTrainingSessionSchema : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Provinces_AspNetUsers_CreatedByUserId",
                table: "Provinces");

            migrationBuilder.DropForeignKey(
                name: "FK_Provinces_AspNetUsers_UpdateByUserId",
                table: "Provinces");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItems_InventoryItems_InventoryItemId",
                table: "SaleItems");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItems_Products_ProductId",
                table: "SaleItems");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItems_Sales_SaleId",
                table: "SaleItems");

            migrationBuilder.DropForeignKey(
                name: "FK_Sales_AspNetUsers_CreatedByUserId",
                table: "Sales");

            migrationBuilder.DropForeignKey(
                name: "FK_Sales_AspNetUsers_UpdateByUserId",
                table: "Sales");

            migrationBuilder.DropForeignKey(
                name: "FK_Trainers_AspNetUsers_CreatedByUserId",
                table: "Trainers");

            migrationBuilder.DropForeignKey(
                name: "FK_Trainers_AspNetUsers_UpdateByUserId",
                table: "Trainers");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegisters_AspNetUsers_CreatedByUserId",
                table: "TrainingRegisters");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegisters_AspNetUsers_UpdateByUserId",
                table: "TrainingRegisters");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegisters_Trainers_TrainerId",
                table: "TrainingRegisters");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegisters_TrainingSessions_TrainingSessionId",
                table: "TrainingRegisters");

            migrationBuilder.DropTable(
                name: "Deliveries");

            migrationBuilder.DropTable(
                name: "Files");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropIndex(
                name: "IX_Trainers_CreatedByUserId",
                table: "Trainers");

            migrationBuilder.DropIndex(
                name: "IX_Trainers_UpdateByUserId",
                table: "Trainers");

            migrationBuilder.DropIndex(
                name: "IX_Provinces_CreatedByUserId",
                table: "Provinces");

            migrationBuilder.DropIndex(
                name: "IX_Provinces_UpdateByUserId",
                table: "Provinces");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrainingRegisters",
                table: "TrainingRegisters");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sales",
                table: "Sales");

            migrationBuilder.DropIndex(
                name: "IX_Sales_CreatedByUserId",
                table: "Sales");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SaleItems",
                table: "SaleItems");

            migrationBuilder.DropIndex(
                name: "IX_SaleItems_ProductId",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "EndDate",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "EndTime",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "Hospital",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "Materials",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "NumberOfParticipants",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "Objectives",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "StartTime",
                table: "TrainingSessions");

            migrationBuilder.DropColumn(
                name: "Bio",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "CreatedByUserId",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "Experience",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "Province",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "Qualification",
                table: "Trainers");

            migrationBuilder.DropColumn(
                name: "CreatedBy",
                table: "Provinces");

            migrationBuilder.DropColumn(
                name: "CreatedByUserId",
                table: "Provinces");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Provinces");

            migrationBuilder.DropColumn(
                name: "UpdateByUserId",
                table: "Provinces");

            migrationBuilder.DropColumn(
                name: "UpdatedBy",
                table: "Provinces");

            migrationBuilder.DropColumn(
                name: "CreatedByName",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CreatedByUserId",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CustomerContactEmail",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CustomerContactName",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CustomerContactPhone",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "DeliveryDate",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "Hospital",
                table: "Sales");

            migrationBuilder.DropColumn(
                name: "CreatedBy",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "DateCreated",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "LastUpdated",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "ProductId",
                table: "SaleItems");

            migrationBuilder.DropColumn(
                name: "ProductName",
                table: "SaleItems");

            migrationBuilder.RenameTable(
                name: "TrainingRegisters",
                newName: "TrainingRegister");

            migrationBuilder.RenameTable(
                name: "Sales",
                newName: "Sale");

            migrationBuilder.RenameTable(
                name: "SaleItems",
                newName: "SaleItem");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "TrainingSessions",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "TrainingSessions",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "StartDate",
                table: "TrainingSessions",
                newName: "Date");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "Trainers",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "Trainers",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "UpdateByUserId",
                table: "Trainers",
                newName: "ProvinceId");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "Provinces",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "Provinces",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "MedicalHistory",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "MedicalHistory",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "InventoryItems",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "InventoryItems",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "Hospitals",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "Hospitals",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "Clinics",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "Clinics",
                newName: "CreatedAt");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegisters_UpdateByUserId",
                table: "TrainingRegister",
                newName: "IX_TrainingRegister_UpdateByUserId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegisters_TrainingSessionId",
                table: "TrainingRegister",
                newName: "IX_TrainingRegister_TrainingSessionId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegisters_TrainerId",
                table: "TrainingRegister",
                newName: "IX_TrainingRegister_TrainerId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegisters_CreatedByUserId",
                table: "TrainingRegister",
                newName: "IX_TrainingRegister_CreatedByUserId");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "Sale",
                newName: "CreatedDate");

            migrationBuilder.RenameColumn(
                name: "UpdateByUserId",
                table: "Sale",
                newName: "ProvinceId");

            migrationBuilder.RenameColumn(
                name: "SalesPerson",
                table: "Sale",
                newName: "CustomerPhone");

            migrationBuilder.RenameColumn(
                name: "Province",
                table: "Sale",
                newName: "CustomerName");

            migrationBuilder.RenameColumn(
                name: "InvoiceNumber",
                table: "Sale",
                newName: "CustomerEmail");

            migrationBuilder.RenameIndex(
                name: "IX_Sales_UpdateByUserId",
                table: "Sale",
                newName: "IX_Sale_ProvinceId");

            migrationBuilder.RenameColumn(
                name: "UpdatedBy",
                table: "SaleItem",
                newName: "InventoryItemId1");

            migrationBuilder.RenameIndex(
                name: "IX_SaleItems_SaleId",
                table: "SaleItem",
                newName: "IX_SaleItem_SaleId");

            migrationBuilder.RenameIndex(
                name: "IX_SaleItems_InventoryItemId",
                table: "SaleItem",
                newName: "IX_SaleItem_InventoryItemId");

            migrationBuilder.AlterColumn<string>(
                name: "Phone",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<int>(
                name: "Population",
                table: "Provinces",
                type: "int",
                nullable: true,
                oldClrType: typeof(long),
                oldType: "bigint",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Sale",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedDate",
                table: "Sale",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime");

            migrationBuilder.AddColumn<int>(
                name: "CustomerId",
                table: "Sale",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "InventoryItemId",
                table: "SaleItem",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrainingRegister",
                table: "TrainingRegister",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sale",
                table: "Sale",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SaleItem",
                table: "SaleItem",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_SaleItem_InventoryItemId1",
                table: "SaleItem",
                column: "InventoryItemId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Sale_Provinces_ProvinceId",
                table: "Sale",
                column: "ProvinceId",
                principalTable: "Provinces",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItem_InventoryItems_InventoryItemId",
                table: "SaleItem",
                column: "InventoryItemId",
                principalTable: "InventoryItems",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItem_InventoryItems_InventoryItemId1",
                table: "SaleItem",
                column: "InventoryItemId1",
                principalTable: "InventoryItems",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItem_Sale_SaleId",
                table: "SaleItem",
                column: "SaleId",
                principalTable: "Sale",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegister_AspNetUsers_CreatedByUserId",
                table: "TrainingRegister",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegister_AspNetUsers_UpdateByUserId",
                table: "TrainingRegister",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegister_Trainers_TrainerId",
                table: "TrainingRegister",
                column: "TrainerId",
                principalTable: "Trainers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegister_TrainingSessions_TrainingSessionId",
                table: "TrainingRegister",
                column: "TrainingSessionId",
                principalTable: "TrainingSessions",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Sale_Provinces_ProvinceId",
                table: "Sale");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItem_InventoryItems_InventoryItemId",
                table: "SaleItem");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItem_InventoryItems_InventoryItemId1",
                table: "SaleItem");

            migrationBuilder.DropForeignKey(
                name: "FK_SaleItem_Sale_SaleId",
                table: "SaleItem");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegister_AspNetUsers_CreatedByUserId",
                table: "TrainingRegister");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegister_AspNetUsers_UpdateByUserId",
                table: "TrainingRegister");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegister_Trainers_TrainerId",
                table: "TrainingRegister");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingRegister_TrainingSessions_TrainingSessionId",
                table: "TrainingRegister");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrainingRegister",
                table: "TrainingRegister");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SaleItem",
                table: "SaleItem");

            migrationBuilder.DropIndex(
                name: "IX_SaleItem_InventoryItemId1",
                table: "SaleItem");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sale",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "CustomerId",
                table: "Sale");

            migrationBuilder.RenameTable(
                name: "TrainingRegister",
                newName: "TrainingRegisters");

            migrationBuilder.RenameTable(
                name: "SaleItem",
                newName: "SaleItems");

            migrationBuilder.RenameTable(
                name: "Sale",
                newName: "Sales");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "TrainingSessions",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "TrainingSessions",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "Date",
                table: "TrainingSessions",
                newName: "StartDate");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Trainers",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Trainers",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "ProvinceId",
                table: "Trainers",
                newName: "UpdateByUserId");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Provinces",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Provinces",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "MedicalHistory",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "MedicalHistory",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "InventoryItems",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "InventoryItems",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Hospitals",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Hospitals",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Clinics",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Clinics",
                newName: "DateCreated");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegister_UpdateByUserId",
                table: "TrainingRegisters",
                newName: "IX_TrainingRegisters_UpdateByUserId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegister_TrainingSessionId",
                table: "TrainingRegisters",
                newName: "IX_TrainingRegisters_TrainingSessionId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegister_TrainerId",
                table: "TrainingRegisters",
                newName: "IX_TrainingRegisters_TrainerId");

            migrationBuilder.RenameIndex(
                name: "IX_TrainingRegister_CreatedByUserId",
                table: "TrainingRegisters",
                newName: "IX_TrainingRegisters_CreatedByUserId");

            migrationBuilder.RenameColumn(
                name: "InventoryItemId1",
                table: "SaleItems",
                newName: "UpdatedBy");

            migrationBuilder.RenameIndex(
                name: "IX_SaleItem_SaleId",
                table: "SaleItems",
                newName: "IX_SaleItems_SaleId");

            migrationBuilder.RenameIndex(
                name: "IX_SaleItem_InventoryItemId",
                table: "SaleItems",
                newName: "IX_SaleItems_InventoryItemId");

            migrationBuilder.RenameColumn(
                name: "CreatedDate",
                table: "Sales",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "ProvinceId",
                table: "Sales",
                newName: "UpdateByUserId");

            migrationBuilder.RenameColumn(
                name: "CustomerPhone",
                table: "Sales",
                newName: "SalesPerson");

            migrationBuilder.RenameColumn(
                name: "CustomerName",
                table: "Sales",
                newName: "Province");

            migrationBuilder.RenameColumn(
                name: "CustomerEmail",
                table: "Sales",
                newName: "InvoiceNumber");

            migrationBuilder.RenameIndex(
                name: "IX_Sale_ProvinceId",
                table: "Sales",
                newName: "IX_Sales_UpdateByUserId");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "TrainingSessions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "EndDate",
                table: "TrainingSessions",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<TimeSpan>(
                name: "EndTime",
                table: "TrainingSessions",
                type: "time",
                nullable: false,
                defaultValue: new TimeSpan(0, 0, 0, 0, 0));

            migrationBuilder.AddColumn<string>(
                name: "Hospital",
                table: "TrainingSessions",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Materials",
                table: "TrainingSessions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "NumberOfParticipants",
                table: "TrainingSessions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Objectives",
                table: "TrainingSessions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<TimeSpan>(
                name: "StartTime",
                table: "TrainingSessions",
                type: "time",
                nullable: false,
                defaultValue: new TimeSpan(0, 0, 0, 0, 0));

            migrationBuilder.AlterColumn<string>(
                name: "Phone",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Bio",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CreatedByUserId",
                table: "Trainers",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Experience",
                table: "Trainers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Trainers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "Province",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Qualification",
                table: "Trainers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AlterColumn<long>(
                name: "Population",
                table: "Provinces",
                type: "bigint",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CreatedBy",
                table: "Provinces",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CreatedByUserId",
                table: "Provinces",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Provinces",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "UpdateByUserId",
                table: "Provinces",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UpdatedBy",
                table: "Provinces",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "InventoryItemId",
                table: "SaleItems",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "CreatedBy",
                table: "SaleItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "DateCreated",
                table: "SaleItems",
                type: "datetime",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "LastUpdated",
                table: "SaleItems",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ProductId",
                table: "SaleItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ProductName",
                table: "SaleItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Sales",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "DateCreated",
                table: "Sales",
                type: "datetime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<string>(
                name: "CreatedByName",
                table: "Sales",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "CreatedByUserId",
                table: "Sales",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CustomerContactEmail",
                table: "Sales",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CustomerContactName",
                table: "Sales",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "CustomerContactPhone",
                table: "Sales",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "DeliveryDate",
                table: "Sales",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Hospital",
                table: "Sales",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrainingRegisters",
                table: "TrainingRegisters",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SaleItems",
                table: "SaleItems",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sales",
                table: "Sales",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "Deliveries",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    SaleId = table.Column<int>(type: "int", nullable: false),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    DeliveryDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DeliveryNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DriverName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    InstitutionName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    InvoiceNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    ItemDescription = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Province = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: false),
                    ReceivedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    RecipientName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RecipientSignature = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    VehicleNumber = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Deliveries", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Deliveries_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Deliveries_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Deliveries_Sales_SaleId",
                        column: x => x.SaleId,
                        principalTable: "Sales",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Files",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    AssociatedId = table.Column<int>(type: "int", nullable: true),
                    AssociatedType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Category = table.Column<int>(type: "int", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FilePath = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FileSize = table.Column<long>(type: "bigint", nullable: false),
                    FileType = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    IsPublic = table.Column<bool>(type: "bit", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    UploadDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UploadedBy = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Files", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Files_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Files_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    Barcode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Category = table.Column<int>(type: "int", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Height = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastRestocked = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    LeadTime = table.Column<int>(type: "int", nullable: false),
                    Length = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    MinimumOrderQuantity = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    SKU = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    Stock = table.Column<int>(type: "int", nullable: false),
                    Supplier = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    Warranty = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Weight = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    Width = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Products", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Products_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Products_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Trainers_CreatedByUserId",
                table: "Trainers",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Trainers_UpdateByUserId",
                table: "Trainers",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Provinces_CreatedByUserId",
                table: "Provinces",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Provinces_UpdateByUserId",
                table: "Provinces",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SaleItems_ProductId",
                table: "SaleItems",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Sales_CreatedByUserId",
                table: "Sales",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Deliveries_CreatedByUserId",
                table: "Deliveries",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Deliveries_SaleId",
                table: "Deliveries",
                column: "SaleId");

            migrationBuilder.CreateIndex(
                name: "IX_Deliveries_UpdateByUserId",
                table: "Deliveries",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Files_CreatedByUserId",
                table: "Files",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Files_UpdateByUserId",
                table: "Files",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_CreatedByUserId",
                table: "Products",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_UpdateByUserId",
                table: "Products",
                column: "UpdateByUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Provinces_AspNetUsers_CreatedByUserId",
                table: "Provinces",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Provinces_AspNetUsers_UpdateByUserId",
                table: "Provinces",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItems_InventoryItems_InventoryItemId",
                table: "SaleItems",
                column: "InventoryItemId",
                principalTable: "InventoryItems",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItems_Products_ProductId",
                table: "SaleItems",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SaleItems_Sales_SaleId",
                table: "SaleItems",
                column: "SaleId",
                principalTable: "Sales",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Sales_AspNetUsers_CreatedByUserId",
                table: "Sales",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Sales_AspNetUsers_UpdateByUserId",
                table: "Sales",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Trainers_AspNetUsers_CreatedByUserId",
                table: "Trainers",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Trainers_AspNetUsers_UpdateByUserId",
                table: "Trainers",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegisters_AspNetUsers_CreatedByUserId",
                table: "TrainingRegisters",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegisters_AspNetUsers_UpdateByUserId",
                table: "TrainingRegisters",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegisters_Trainers_TrainerId",
                table: "TrainingRegisters",
                column: "TrainerId",
                principalTable: "Trainers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingRegisters_TrainingSessions_TrainingSessionId",
                table: "TrainingRegisters",
                column: "TrainingSessionId",
                principalTable: "TrainingSessions",
                principalColumn: "Id");
        }
    }
}
