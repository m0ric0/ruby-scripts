# 標準入力
input_line = readlines(chomp: true).map{|l| l.split(' ').map(&:to_i)}

# 1. input_line `[N, M]` の先頭の要素を取り出し
# N => ゴンドラの数
# M => 列に並んでいるグループ数
n_and_m = input_line.shift

# 一次元配列
input_line.flatten!

# 2. 1を取り出した後の 先頭から..N の要素を取り出し
# input_line[0..N] => ゴンドラ毎に乗り込める人数 (A_i)
a_1 = input_line.shift(n_and_m[0])

# 3. 1,2を取り出した後の 先頭から..M の要素を取り出し
# input_line[0..M] => グループ毎の人数 (B_i)
b_1 = input_line.shift(n_and_m[1])

# 以下の条件を満たすこと
# 1 ≦ N, M ≦ 30
return unless 1 <= n_and_m[0] && n_and_m[1] <= 30
# ・1 ≦ A_i ≦ 100 (1 ≦ i ≦ N)
a_1.map {|i| return unless (1 <= i && i <= 100)}
# ・1 ≦ B_i ≦ 100 (1 ≦ i ≦ M)
b_1.map {|i| return unless (1 <= i && i <= 100)}


# 合計乗車人数
c_1 = Array.new(a_1.length, 0)

# 初期化
i = 0

b_1.map do |b|
    p b
    # a_1.map.with_index do |a, i|
    a_1.map do |a|
        next if b <= 0
        # p b
        puts "a=#{a} | b=#{b} | i=#{i}"
        
        c_1[i] = a < b ? c_1[i] + a : c_1[i] + b

        b = b - a
     
        i = i + 1 < a_1.length ? i.succ : 0
        # next
        p c_1
    end
    # puts "-----------------"
end

p c_1

