using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddNewFkRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ContactDetails",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserProfileId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: false),
                    ContactTypeId = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    ContactDataTypeId = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    ContactEntityId = table.Column<int>(type: "int", nullable: false, defaultValue: 1),
                    Data = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ContactDetails", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ContactDetails_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ContactDetails_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ContactDetails_ContactDataType_ContactDataTypeId",
                        column: x => x.ContactDataTypeId,
                        principalTable: "ContactDataType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ContactDetails_ContactEntity_ContactEntityId",
                        column: x => x.ContactEntityId,
                        principalTable: "ContactEntity",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ContactDetails_ContactType_ContactTypeId",
                        column: x => x.ContactTypeId,
                        principalTable: "ContactType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ContactDetails_UserProfile_UserProfileId",
                        column: x => x.UserProfileId,
                        principalTable: "UserProfile",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_ContactDataTypeId",
                table: "ContactDetails",
                column: "ContactDataTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_ContactEntityId",
                table: "ContactDetails",
                column: "ContactEntityId");

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_ContactTypeId",
                table: "ContactDetails",
                column: "ContactTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_CreatedBy",
                table: "ContactDetails",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_UpdatedBy",
                table: "ContactDetails",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_ContactDetails_UserProfileId",
                table: "ContactDetails",
                column: "UserProfileId",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ContactDetails");
        }
    }
}
