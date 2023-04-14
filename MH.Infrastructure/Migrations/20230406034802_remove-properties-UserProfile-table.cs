using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class removepropertiesUserProfiletable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserProfile_AspNetUsers_UserId",
                table: "UserProfile");

            migrationBuilder.DropForeignKey(
                name: "FK_UserProfileImage_UserProfile_UserProfileId",
                table: "UserProfileImage");

            migrationBuilder.DropIndex(
                name: "IX_UserProfile_CityId",
                table: "UserProfile");

            migrationBuilder.DropIndex(
                name: "IX_UserProfile_CountryId",
                table: "UserProfile");

            migrationBuilder.DropIndex(
                name: "IX_UserProfile_StateId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Address1",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Address2",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Age",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "CityId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "CountryId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Gender",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "LanguageId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "StateId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "ZipCode",
                table: "UserProfile");

            migrationBuilder.AddColumn<string>(
                name: "Notes",
                table: "UserProfile",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<byte[]>(
                name: "Photo",
                table: "UserProfile",
                type: "varbinary(max)",
                nullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_UserProfile_AspNetUsers_UserId",
                table: "UserProfile",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserProfile_AspNetUsers_UserId",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Notes",
                table: "UserProfile");

            migrationBuilder.DropColumn(
                name: "Photo",
                table: "UserProfile");

            migrationBuilder.AddColumn<string>(
                name: "Address1",
                table: "UserProfile",
                type: "nvarchar(300)",
                maxLength: 300,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Address2",
                table: "UserProfile",
                type: "nvarchar(300)",
                maxLength: 300,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Age",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CityId",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CountryId",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "UserProfile",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Gender",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "LanguageId",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StateId",
                table: "UserProfile",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ZipCode",
                table: "UserProfile",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserProfile_CityId",
                table: "UserProfile",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_UserProfile_CountryId",
                table: "UserProfile",
                column: "CountryId");

            migrationBuilder.CreateIndex(
                name: "IX_UserProfile_StateId",
                table: "UserProfile",
                column: "StateId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserProfile_AspNetUsers_UserId",
                table: "UserProfile",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_UserProfileImage_UserProfile_UserProfileId",
                table: "UserProfileImage",
                column: "UserProfileId",
                principalTable: "UserProfile",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
