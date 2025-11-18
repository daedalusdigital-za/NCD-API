using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ConvertProvinceToProvinceId : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Province",
                table: "TrainingSession");

            migrationBuilder.AddColumn<int>(
                name: "ProvinceId",
                table: "TrainingSession",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_TrainingSession_ProvinceId",
                table: "TrainingSession",
                column: "ProvinceId");

            migrationBuilder.AddForeignKey(
                name: "FK_TrainingSession_Provinces_ProvinceId",
                table: "TrainingSession",
                column: "ProvinceId",
                principalTable: "Provinces",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TrainingSession_Provinces_ProvinceId",
                table: "TrainingSession");

            migrationBuilder.DropIndex(
                name: "IX_TrainingSession_ProvinceId",
                table: "TrainingSession");

            migrationBuilder.DropColumn(
                name: "ProvinceId",
                table: "TrainingSession");

            migrationBuilder.AddColumn<string>(
                name: "Province",
                table: "TrainingSession",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
