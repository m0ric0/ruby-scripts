# 標準入力
input_line = readlines(chomp: true).map{|l| l.split(' ').map(&:to_i)}

############################################
# example.
# [[4, 6], 4, 2, 4, 2, 9, 3, 5, 7, 1, 3]
############################################

# 1. input_line `[N, M]` の先頭の要素を取り出し
# N => 入れ物の数
# M => 総グループ数
n_and_m = input_line.shift
# 1 ≦ N, M ≦ 30
return unless 1 <= n_and_m[0] && n_and_m[1] <= 30

# 一次元配列
input_line.flatten!

# 2. 1を取り出した後の 先頭から..N の要素を取り出し
# input_line[0..N] => 入れ物に入る数 (A_i)
a_1 = input_line.shift(n_and_m[0])
# 1 ≦ A_i ≦ 100 (1 ≦ i ≦ N)
a_1.map {|i| return unless (1 <= i && i <= 100)}

# 3. 1,2を取り出した後の 先頭から..M の要素を取り出し
# input_line[0..M] => グループ毎の人数 (B_i)
b_1 = input_line.shift(n_and_m[1])
# 1 ≦ B_i ≦ 100 (1 ≦ i ≦ M)
b_1.map {|i| return unless (1 <= i && i <= 100)}

# 合計数
c_1 = Array.new(a_1.length, 0)

# 初期化
i = 0
b_1.map do |b|
  a_1.length.times do |a|
    break if b <= 0

    c_1[i] = a_1[i] < b ? c_1[i] + a_1[i] : c_1[i] + b
    b = b - a_1[i]
    i = i + 1 < a_1.length ? i.succ : 0
  end
end

p c_1
