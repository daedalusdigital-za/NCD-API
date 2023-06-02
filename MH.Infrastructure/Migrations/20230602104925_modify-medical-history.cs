using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class modifymedicalhistory : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Documents",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Notes",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Symptoms",
                table: "MedicalHistory");

            migrationBuilder.AlterColumn<double>(
                name: "UricAcid",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "TotalColestorl",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "Lactate",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "KeyTone",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "HBA1C",
                table: "MedicalHistory",
                type: "float",
                maxLength: 250,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldMaxLength: 250,
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "Glucose",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<double>(
                name: "BloodPressue",
                table: "MedicalHistory",
                type: "float",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "UricAcid",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "TotalColestorl",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Lactate",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "KeyTone",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "HBA1C",
                table: "MedicalHistory",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldMaxLength: 250,
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Glucose",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BloodPressue",
                table: "MedicalHistory",
                type: "int",
                nullable: true,
                oldClrType: typeof(double),
                oldType: "float",
                oldNullable: true);

            migrationBuilder.AddColumn<byte[]>(
                name: "Documents",
                table: "MedicalHistory",
                type: "varbinary(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Notes",
                table: "MedicalHistory",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Symptoms",
                table: "MedicalHistory",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
