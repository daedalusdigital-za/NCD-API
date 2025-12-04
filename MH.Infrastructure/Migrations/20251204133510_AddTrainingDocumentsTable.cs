using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddTrainingDocumentsTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_InventoryItems_AspNetUsers_CreatedByUserId",
                table: "InventoryItems");

            migrationBuilder.DropForeignKey(
                name: "FK_InventoryItems_AspNetUsers_UpdateByUserId",
                table: "InventoryItems");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_CreatedBy",
                table: "TrainingSession");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_AspNetUsers_UpdatedBy",
                table: "TrainingSession");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_Province_ProvinceId",
                table: "TrainingSession");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_Trainer_TrainerId",
                table: "TrainingSession");

            migrationBuilder.DropTable(
                name: "Patient");

            migrationBuilder.DropTable(
                name: "TrainingRegister");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_CreatedBy",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_TrainerId",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_UpdatedBy",
                table: "TrainingSession");

            migrationBuilder.DropPrimaryKey(
                name: "PK_InventoryItems",
                table: "InventoryItems");

            migrationBuilder.DropIndex(
                name: "IX_InventoryItems_CreatedByUserId",
                table: "InventoryItems");

            migrationBuilder.DropIndex(
                name: "IX_InventoryItems_UpdateByUserId",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "CreatedByUserId",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "ItemNumber",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "LastRestocked",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "Location",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "MaxStockLevel",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "QtyOnHand",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "QtyOnPO",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "QtyOnSO",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "TotalCostForQOH",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "UOM",
                table: "InventoryItems");

            migrationBuilder.DropColumn(
                name: "UnitCostForQOH",
                table: "InventoryItems");

            migrationBuilder.RenameTable(
                name: "InventoryItems",
                newName: "InventoryItem");

            migrationBuilder.RenameColumn(
                name: "CreatedDate",
                table: "TrainingSession",
                newName: "DateCreated");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Trainer",
                newName: "Specialization");

            migrationBuilder.RenameColumn(
                name: "Location",
                table: "Trainer",
                newName: "LastName");

            migrationBuilder.RenameColumn(
                name: "LastUpdated",
                table: "Clinics",
                newName: "UpdatedAt");

            migrationBuilder.RenameColumn(
                name: "CreatedDate",
                table: "Clinics",
                newName: "CreatedAt");

            migrationBuilder.RenameColumn(
                name: "UpdateByUserId",
                table: "InventoryItem",
                newName: "ModifiedBy");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "TrainingSession",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "DateCreated",
                table: "TrainingSession",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Trainer",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Certification",
                table: "Trainer",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Experience",
                table: "Trainer",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "FirstName",
                table: "Trainer",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Trainer",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Trainer",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "ModifiedBy",
                table: "Trainer",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Supplier",
                table: "InventoryItem",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "InventoryItem",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "InventoryItem",
                type: "nvarchar(1000)",
                maxLength: 1000,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedDate",
                table: "InventoryItem",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedBy",
                table: "InventoryItem",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<string>(
                name: "BatchNumber",
                table: "InventoryItem",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "InventoryItem",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "SKU",
                table: "InventoryItem",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "UnitOfMeasure",
                table: "InventoryItem",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<decimal>(
                name: "UnitPrice",
                table: "InventoryItem",
                type: "decimal(18,2)",
                precision: 18,
                scale: 2,
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddPrimaryKey(
                name: "PK_InventoryItem",
                table: "InventoryItem",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "TrainingDocuments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TrainingSessionId = table.Column<int>(type: "int", nullable: false),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OriginalFileName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FileSize = table.Column<long>(type: "bigint", nullable: false),
                    FilePath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MimeType = table.Column<string>(type: "nvarchar(max)", nullable: true, defaultValue: "application/pdf"),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    UploadedBy = table.Column<int>(type: "int", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrainingDocuments", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_InventoryItem_CreatedBy",
                table: "InventoryItem",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryItem_UpdatedBy",
                table: "InventoryItem",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingDocuments_TrainingSessionId",
                table: "TrainingDocuments",
                column: "TrainingSessionId");

            migrationBuilder.AddForeignKey(
                name: "FK_InventoryItem_AspNetUsers_CreatedBy",
                table: "InventoryItem",
                column: "CreatedBy",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "FK_InventoryItem_AspNetUsers_UpdatedBy",
                table: "InventoryItem",
                column: "UpdatedBy",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_Province_ProvinceId",
                table: "TrainingSession",
                column: "ProvinceId",
                principalTable: "Province",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_InventoryItem_AspNetUsers_CreatedBy",
                table: "InventoryItem");

            migrationBuilder.DropForeignKey(
                name: "FK_InventoryItem_AspNetUsers_UpdatedBy",
                table: "InventoryItem");

            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_Province_ProvinceId",
                table: "TrainingSession");

            migrationBuilder.DropTable(
                name: "TrainingDocuments");

            migrationBuilder.DropPrimaryKey(
                name: "PK_InventoryItem",
                table: "InventoryItem");

            migrationBuilder.DropIndex(
                name: "IX_InventoryItem_CreatedBy",
                table: "InventoryItem");

            migrationBuilder.DropIndex(
                name: "IX_InventoryItem_UpdatedBy",
                table: "InventoryItem");

            migrationBuilder.DropColumn(
                name: "Certification",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "Experience",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "FirstName",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "ModifiedBy",
                table: "Trainer");

            migrationBuilder.DropColumn(
                name: "BatchNumber",
                table: "InventoryItem");

            migrationBuilder.DropColumn(
                name: "Name",
                table: "InventoryItem");

            migrationBuilder.DropColumn(
                name: "SKU",
                table: "InventoryItem");

            migrationBuilder.DropColumn(
                name: "UnitOfMeasure",
                table: "InventoryItem");

            migrationBuilder.DropColumn(
                name: "UnitPrice",
                table: "InventoryItem");

            migrationBuilder.RenameTable(
                name: "InventoryItem",
                newName: "InventoryItems");

            migrationBuilder.RenameColumn(
                name: "DateCreated",
                table: "TrainingSession",
                newName: "CreatedDate");

            migrationBuilder.RenameColumn(
                name: "Specialization",
                table: "Trainer",
                newName: "Name");

            migrationBuilder.RenameColumn(
                name: "LastName",
                table: "Trainer",
                newName: "Location");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Clinics",
                newName: "LastUpdated");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Clinics",
                newName: "CreatedDate");

            migrationBuilder.RenameColumn(
                name: "ModifiedBy",
                table: "InventoryItems",
                newName: "UpdateByUserId");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "TrainingSession",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedDate",
                table: "TrainingSession",
                type: "datetime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "Trainer",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Trainer",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<string>(
                name: "Supplier",
                table: "InventoryItems",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldMaxLength: 200,
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "LastUpdated",
                table: "InventoryItems",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "InventoryItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(1000)",
                oldMaxLength: 1000,
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedDate",
                table: "InventoryItems",
                type: "datetime",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedBy",
                table: "InventoryItems",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CreatedByUserId",
                table: "InventoryItems",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ItemNumber",
                table: "InventoryItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastRestocked",
                table: "InventoryItems",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Location",
                table: "InventoryItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "MaxStockLevel",
                table: "InventoryItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "QtyOnHand",
                table: "InventoryItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "QtyOnPO",
                table: "InventoryItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "QtyOnSO",
                table: "InventoryItems",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<decimal>(
                name: "TotalCostForQOH",
                table: "InventoryItems",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<string>(
                name: "UOM",
                table: "InventoryItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<decimal>(
                name: "UnitCostForQOH",
                table: "InventoryItems",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddPrimaryKey(
                name: "PK_InventoryItems",
                table: "InventoryItems",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "Patient",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    Age = table.Column<double>(type: "float", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: true),
                    District = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Gender = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    Gesttational = table.Column<bool>(type: "bit", nullable: true),
                    Institution = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    PatientNumber = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    PhoneNumber = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    Province = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Surname = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Patient", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Patient_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patient_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TrainingRegister",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedByUserId = table.Column<int>(type: "int", nullable: true),
                    TrainerId = table.Column<int>(type: "int", nullable: true),
                    TrainingSessionId = table.Column<int>(type: "int", nullable: true),
                    UpdateByUserId = table.Column<int>(type: "int", nullable: true),
                    AttendanceRate = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CertificatesIssued = table.Column<int>(type: "int", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    Duration = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    Participants = table.Column<int>(type: "int", nullable: false),
                    RegisterFile = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SessionTitle = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Status = table.Column<int>(type: "int", nullable: false),
                    Topic = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Trainer = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    Venue = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrainingRegister", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrainingRegister_AspNetUsers_CreatedByUserId",
                        column: x => x.CreatedByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_TrainingRegister_AspNetUsers_UpdateByUserId",
                        column: x => x.UpdateByUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_TrainingRegister_Trainer_TrainerId",
                        column: x => x.TrainerId,
                        principalTable: "Trainer",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_TrainingRegister_TrainingSession_TrainingSessionId",
                        column: x => x.TrainingSessionId,
                        principalTable: "TrainingSession",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_CreatedBy",
                table: "TrainingSession",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_TrainerId",
                table: "TrainingSession",
                column: "TrainerId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_UpdatedBy",
                table: "TrainingSession",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryItems_CreatedByUserId",
                table: "InventoryItems",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_InventoryItems_UpdateByUserId",
                table: "InventoryItems",
                column: "UpdateByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Patient_CreatedBy",
                table: "Patient",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_Patient_UpdatedBy",
                table: "Patient",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRegister_CreatedByUserId",
                table: "TrainingRegister",
                column: "CreatedByUserId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRegister_TrainerId",
                table: "TrainingRegister",
                column: "TrainerId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRegister_TrainingSessionId",
                table: "TrainingRegister",
                column: "TrainingSessionId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRegister_UpdateByUserId",
                table: "TrainingRegister",
                column: "UpdateByUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_InventoryItems_AspNetUsers_CreatedByUserId",
                table: "InventoryItems",
                column: "CreatedByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_InventoryItems_AspNetUsers_UpdateByUserId",
                table: "InventoryItems",
                column: "UpdateByUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_Province_ProvinceId",
                table: "TrainingSession",
                column: "ProvinceId",
                principalTable: "Province",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_Trainer_TrainerId",
                table: "TrainingSession",
                column: "TrainerId",
                principalTable: "Trainer",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
