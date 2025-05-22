using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HotelApp.Migrations
{
    /// <inheritdoc />
    public partial class AddChatDB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "61d5299e-d15d-471f-a59a-b1fce80b7f8b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "dfabd021-3799-421a-b0bb-f8c78d14a429");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "08039fcd-41a7-4d2a-80d4-3d9be39b598f", null, "Admin", "ADMIN" },
                    { "ec3e25af-d882-4071-ad50-bc415c6d2381", null, "Client", "CLIENT" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "08039fcd-41a7-4d2a-80d4-3d9be39b598f");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "ec3e25af-d882-4071-ad50-bc415c6d2381");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "61d5299e-d15d-471f-a59a-b1fce80b7f8b", null, "Admin", "ADMIN" },
                    { "dfabd021-3799-421a-b0bb-f8c78d14a429", null, "Client", "CLIENT" }
                });
        }
    }
}
