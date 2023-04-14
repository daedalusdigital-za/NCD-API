using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveuserProfileImage : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Position_PositionId",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "UserProfileImage");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Position_PositionId",
                table: "AspNetUsers",
                column: "PositionId",
                principalTable: "Position",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Position_PositionId",
                table: "AspNetUsers");

            migrationBuilder.CreateTable(
                name: "UserProfileImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedBy = table.Column<int>(type: "int", nullable: false),
                    UpdatedBy = table.Column<int>(type: "int", nullable: true),
                    ContentType = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Data = table.Column<byte[]>(type: "varbinary(max)", nullable: false),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: false),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false),
                    LastUpdated = table.Column<DateTime>(type: "datetime", nullable: true),
                    UserProfileId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserProfileImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserProfileImage_AspNetUsers_CreatedBy",
                        column: x => x.CreatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserProfileImage_AspNetUsers_UpdatedBy",
                        column: x => x.UpdatedBy,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserProfileImage_CreatedBy",
                table: "UserProfileImage",
                column: "CreatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_UserProfileImage_UpdatedBy",
                table: "UserProfileImage",
                column: "UpdatedBy");

            migrationBuilder.CreateIndex(
                name: "IX_UserProfileImage_UserProfileId",
                table: "UserProfileImage",
                column: "UserProfileId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Position_PositionId",
                table: "AspNetUsers",
                column: "PositionId",
                principalTable: "Position",
                principalColumn: "Id");
        }
    }
}
