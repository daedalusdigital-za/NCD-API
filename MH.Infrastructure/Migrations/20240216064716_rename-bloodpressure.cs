using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class renamebloodpressure : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "BloodPressue",
                table: "MedicalHistory",
                newName: "BloodPressure");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "BloodPressure",
                table: "MedicalHistory",
                newName: "BloodPressue");
        }
    }
}
