using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HotelApp.Migrations
{
    /// <inheritdoc />
    public partial class AddLocation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "9eeb3b1c-d25c-4438-8c4c-1e52e63d8062");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "feba5148-fdc7-4a2c-8874-1504b5c52c55");

            migrationBuilder.AddColumn<string>(
                name: "PhuongXa",
                table: "Rooms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "QuanHuyen",
                table: "Rooms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "61d5299e-d15d-471f-a59a-b1fce80b7f8b", null, "Admin", "ADMIN" },
                    { "dfabd021-3799-421a-b0bb-f8c78d14a429", null, "Client", "CLIENT" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "61d5299e-d15d-471f-a59a-b1fce80b7f8b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "dfabd021-3799-421a-b0bb-f8c78d14a429");

            migrationBuilder.DropColumn(
                name: "PhuongXa",
                table: "Rooms");

            migrationBuilder.DropColumn(
                name: "QuanHuyen",
                table: "Rooms");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "9eeb3b1c-d25c-4438-8c4c-1e52e63d8062", null, "Client", "CLIENT" },
                    { "feba5148-fdc7-4a2c-8874-1504b5c52c55", null, "Admin", "ADMIN" }
                });
        }
    }
}
