using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addedtableTicketStatusfk : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails",
                column: "StatusId");

            migrationBuilder.AddForeignKey(
                name: "FK_TicketDetails_TicketStatus_StatusId",
                table: "TicketDetails",
                column: "StatusId",
                principalTable: "TicketStatus",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TicketDetails_TicketStatus_StatusId",
                table: "TicketDetails");

            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails");
        }
    }
}
