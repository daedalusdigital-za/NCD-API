using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addedtableIssue1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_IssueId",
                table: "TicketDetails");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_IssueId",
                table: "TicketDetails",
                column: "IssueId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_IssueId",
                table: "TicketDetails");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_IssueId",
                table: "TicketDetails",
                column: "IssueId",
                unique: true);
        }
    }
}
