using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addfkmedicalhistory : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_MedicalHistory_RecordedBy",
                table: "MedicalHistory",
                column: "RecordedBy");

            migrationBuilder.AddForeignKey(
                name: "FK_MedicalHistory_AspNetUsers_RecordedBy",
                table: "MedicalHistory",
                column: "RecordedBy",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MedicalHistory_AspNetUsers_RecordedBy",
                table: "MedicalHistory");

            migrationBuilder.DropIndex(
                name: "IX_MedicalHistory_RecordedBy",
                table: "MedicalHistory");
        }
    }
}
