using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text;
using System.Web;

namespace Charity.Helpers
{
    public static class StringHelper
    {
        public static string Truncate(string value, int maxLength)
        {
            if (string.IsNullOrEmpty(value)) return value;
            if (value.Length <= maxLength) return value;

            // Cắt ngắn đến độ dài tối đa
            var truncatedString = value.Substring(0, maxLength);

            // Tìm vị trí khoảng trắng cuối cùng
            var lastSpaceIndex = truncatedString.LastIndexOf(' ');

            // Nếu có khoảng trắng, cắt ngắn đến vị trí đó
            if (lastSpaceIndex > 0)
            {
                truncatedString = truncatedString.Substring(0, lastSpaceIndex);
            }

            return truncatedString + "...";
        }

        public static string RemoveDiacriticsAndReplaceSpaces(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return string.Empty;

            // Chuyển đổi tiếng Việt có dấu thành không dấu
            string normalizedString = input.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            foreach (var c in normalizedString)
            {
                // Chỉ thêm các ký tự không phải dấu (NonSpacingMark)
                if (CharUnicodeInfo.GetUnicodeCategory(c) != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            // Chuyển chuỗi đã loại bỏ dấu trở lại về dạng Form C
            string noDiacritics = sb.ToString().Normalize(NormalizationForm.FormC);

            // Thay thế các khoảng trắng bằng dấu gạch ngang và loại bỏ các ký tự không phải chữ cái và số
            string result = Regex.Replace(noDiacritics, @"\s+", "-");  // Thay thế khoảng trắng thành "-"
            result = Regex.Replace(result, @"[^a-zA-Z0-9\-]", "");    // Loại bỏ các ký tự đặc biệt, chỉ giữ chữ cái, số và dấu gạch ngang

            return result.ToLower(); // Trả về chuỗi viết thường
        }
    }


}