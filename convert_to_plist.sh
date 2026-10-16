#!/bin/bash
# 输入文件
input_file="replace_rules.txt"
# 输出文件
output_file="replace_rules.plist"
# 检查输入文件是否存在
if [ ! -f "$input_file" ]; then
    echo "输入文件不存在: $input_file"
    exit 1
fi
# 创建临时文件
temp_file=$(mktemp)
# 将输入文件内容转换为 plist 格式
echo '<?xml version="1.0" encoding="UTF-8"?>' > "$temp_file"
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> "$temp_file"
echo '<plist version="1.0"><array>' >> "$temp_file"
while IFS='|' read -r phrase shortcut; do
    echo '    <dict>' >> "$temp_file"
    echo "        <key>phrase</key><string>$phrase</string>" >> "$temp_file"
    echo "        <key>shortcut</key><string>$shortcut</string>" >> "$temp_file"
    echo '    </dict>' >> "$temp_file"
done < "$input_file"
echo '</array></plist>' >> "$temp_file"
# 将临时文件复制到输出文件
mv "$temp_file" "$output_file"
echo "转换完成。输出文件：$output_file"