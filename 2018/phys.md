---
title: Lie 代数と量子群
---

$$
\newcommand\sl{\frk{sl}_2}
$$

これは，[数理物理 Advent Calendar 2018](https://adventar.org/calendars/3084) の21日目の記事です．
昨日は hattan0523 さんの[Auter-Townes 効果について](https://leo0523.hatenablog.com/entry/2018/12/19/222020)でした．

# Lie 代数の定義

$k$ を（標数 $0$ の）体とします．物理学では，基本的に $k = \mathbb{R}$ か $k = \mathbb{C}$ の場合のみを考えればよいでしょう．
$k$ 上の**Lie 代数**（*Lie algebra*）とは，$k$ 上のベクトル空間 $\frk g$ であって，交代的な双線型写像 $\brk{\cdot, \cdot} \colon \frk g \times \frk g \to \frk g$ （線型写像 $\brk{\cdot, \cdot} \colon \frk g \wedge \frk g \to \frk g$ と言ってもよい）が存在し，Jacobi恒等式
$$
\brk{x, \brk{y, z}} + \brk{y, \brk{z, x}} + \brk{z, \brk{x, y}} = 0
$$
が任意の $x, y, z \in \frk g$ に対して成り立つものをいいます．

Lie 代数 $\frk g$ の**部分 Lie 代数**（*Lie subalgebras*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$ であって，任意の $x, y \in \frk h$ に対して $\brk{x, y} \in \frk h$ となることをいいます．

Lie 代数 $\frk g$ の**イデアル**（*ideal*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$ であって，任意の $x \in \frk h$ と $y \in \frk g$ に対して $\brk{x, y} \in \frk h$ となることをいいます．容易に分かるように，Lie 代数のイデアルは部分 Lie 代数になります．

Lie 代数間の写像 $\varphi \colon \frk g \to \frk h$ が **Lie 代数準同型**（*Lie algebra homomorphism*）であるとは，線型写像であって，任意の $x, y \in \frk g$ に対して，
$$
\varphi (\brk{x, y}) = \brk{\varphi (x), \varphi (y)}
$$
となることをいいます．Lie 代数準同型の核はイデアルであり，像は部分 Lie 代数です．

最も身近な Lie 代数の例は $\frk{gl} (n, k)$ でしょう．これは，ベクトル空間としては $k$ 上の $n$ 次行列全体 $M (n, k)$ であり，その上のブラケットを $x, y \in M (n, k)$ に対して
$$
\brk{x, y} := x y - y x
$$
と定めたものです．左辺は行列の積および差です．これが実際に $k$ 上の Lie 代数となることは，簡単な計算によって確かめられます．

$\frk{gl} (n, k)$ のイデアル $\frk{sl} (n, k) := \{ x \in \frk{gl} (n, k) \mid \tr x = 0 \}$ も重要です．

同様に，$k$ 上ベクトル空間 $V$ の自己準同型全体 $\End (V)$ に
$$
\brk{f, g} := f \circ g - g \circ f \quad (f, g \in \End (V))
$$
として Lie 代数の構造を入れたものを $\frk{gl} (V)$ と書きます．


<div class="Thm Definition">
$k$ 上 Lie 代数 $\frk g$ の**表現**（*representations*）とは，$k$ 上ベクトル空間 $V$ と Lie 代数準同型 $\rho \colon \frk g \to \frk{gl} (V)$ のペアのことをいう．誤解の恐れがない場合，$V$ や $\rho$ のことを表現と呼ぶこともある．$V$ を**$\frk g$ 加群**（*$\frk g$-module*）ともいう．
</div>

表現には色々な側面がありますが，そのうちの一つは「Lie 代数という抽象的な概念を，$\frk{gl} (V)$ という具体的で扱いやすいものを通じて調べる」ことです．

# Lie 代数の表現

Lie 代数の表現についての詳細は [Humphreys](https://www.springer.com/us/book/9780387900537) を読んでもらうこととして，具体的に $\sl := \frk{sl} (2, k)$ の表現を考えます．

$\sl$ の基底として
$$
\begin{align*}
e &:= \begin{pmatrix} 0 & 1 \\ 0 &  0 \end{pmatrix}, \\
f &:= \begin{pmatrix} 0 & 0 \\ 1 &  0 \end{pmatrix}, \\
h &:= \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}
\end{align*}
$$
を取ります．

$k [x, y]$ を $k$ 上の（可換な）2変数多項式環とし，$k [x, y]_m \subset k [x, y]$ を $m$ 次斉次多項式と $0$ からなる集合とすれば，$k [x, y]_m$ は $m + 1$ 次元ベクトル空間であり，ベクトル空間として
$$
k [x, y] = \bigoplus_{m = 0}^\infty k [x, y]_m
$$
となっていることが分かります．

今，$\frk{sl} (2, k)$ を $k [x, y]$ 上の微分作用素として次のように作用させます：$P (x, y) \in k [x, y]$ に対して
$$
\begin{align*}
(e P) (x, y) &:= x \frac{\partial P}{\partial y} (x, y), \\
(f P) (x, y) &:= y \frac{\partial P}{\partial x} (x, y), \\
(h P) (x, y) &:= x \frac{\partial P}{\partial x} (x, y) - y \frac{\partial P}{\partial y} (x, y).
\end{align*}
$$

これが実際に $\sl$ の表現となることは簡単な計算により分かります．また，$k [x, y]_m$ は $\sl$ の作用で不変です．すなわち，$\sl \cdot k [x, y]_m \subset k [x, y]_m$ となります．

この表現を $(V_m := k [x, y]_m, \rho_m)$ と書くことにします．$V_m$ の基底 $\{ x^i y^{m - i} \mid 0 \le i \le m \}$ について $\rho (e), \rho (f), \rho (h)$ をそれぞれ行列表示すれば，とても簡単な行列になっていることが簡単に分かります．

さて，この表現を用いて $V_m \otimes V_m$ を $\sl$ の表現を作りましょう．（量子力学的にも重要です．）そのために $\sl$ の普遍包絡環が必要です．

<div class="Thm Definition">
3つのベクトル $\widetilde{e}, \widetilde{f}, \widetilde{h}$ から作られるテンソル代数 $T = T \{ e, f, h \}$ を考える．$\sl$ の関係式に対応する部分集合
$$
\{ \brk{\widetilde{e}, \widetilde{f}} - \widetilde{h}, \brk{\widetilde{h}, \widetilde{e}} - 2 \widetilde{e}, \brk{\widetilde{h}, \widetilde{f}} - 2 \widetilde{f} \}
$$
から生成される $T$ の（代数としての）イデアルを $I \subset T$ とおく：
$$
I := ( \brk{e, f} - h, \brk{h, e} - 2 e, \brk{h, f} - 2 f )
$$
このとき，商代数 $U (\sl) := T / I$ を $\sl$ の**普遍包絡環**（*universal enveloping algebra*）という．$\widetilde{e}, \widetilde{f}, \widetilde{h} \in T$ に対応する $U (\sl)$ の元を単にそれぞれ $e, f, h$ と書く．
</div>

<div class="Thm Definition">
$k$ 上代数 $A$ の**表現**（*representations*）とは，$k$ 上ベクトル空間 $V$ と代数準同型 $\rho \colon A \to \End (V)$ のペアのことをいう．その他の言葉も Lie 代数の場合と同様に定義される．
</div>

$\sl$ の表現から自然に $U (\sl)$ の表現を作ることができます．すなわち，$v = v_1 \otimes \dotsc \otimes v_n \in U (\sl)$ （$v_i \in \sl$）と $P(x, y) \in V_m$ に対して
$$
(v P) (x, y) := ( v_1 ( \dotsb (v_n P) \dotsb ) ) (x, y)
$$
と帰納的に定まります．この表現を $\sl$ の場合と同じ記号で $(V_m, \rho_m)$ とします．

$V_m \otimes V_m$ を $U (\sl)$ の表現と考える前に，代数準同型 $\Delta \colon U (\sl) \to U (\sl) \otimes U (\sl)$ を $\Delta (v) := v \otimes 1 + 1 \otimes v$ により定義します（$v \in \sl$）．さらに，$\rho_m \colon U (\sl) \to \End (V_m)$ は代数準同型なので，代数準同型
$$
\rho_m \otimes \rho_m \colon U (\sl)^{\otimes 2} \to \End (V_m^{\otimes 2})
$$
があります．（正確には $\End (V_m)^{\otimes 2}$ ですが，$V_m$ が有限次元なので気にしなくてもよいです．）ただし，ベクトル空間 $V$ に対して $V^{\otimes 2} := V \otimes V$ と書いています．これらの合成
$$
(\rho_m \otimes \rho_m) \circ \Delta \colon U (\sl) \to \End (V_m^{\otimes 2})
$$
は代数準同型なので，これにより $V_m^{\otimes 2}$ が $U (\sl)$ 加群となります．

# 量子化

物理的にも数学的にもテンソル積表現（上の $(V_m^{\otimes 2}, (\rho_m \otimes \rho_m) \circ \Delta)$ 等）は重要ですが，その定義には $\Delta$ という代数準同型がポイントでした．圏論的に見ると $\Delta$ は代数上の積の双対概念であり，**余積**（*comultiplication*）と呼ばれます．

一般に，ベクトル空間 $V, W$ に対して，その**フリップ**（*flip*）$\tau \colon V \otimes W \to W \otimes V$ が $\tau (x \otimes y) := y \otimes x$ によって定義されます．これを用いると，上の $\Delta$ は
$$
\Delta = \tau \circ \Delta
$$
を満たすことが分かります．これは積の可換律の双対概念であり，**余可換律**（*cocommutativity*）です．

さて，$U (\sl)$ の定義を少しいじって $\Delta$ が非余可換となるようにしてみましょう．非常に天下り的ですが（物理的な由来があると思いますが知りません），$U (\sl)$ の量子化 $U_q (\sl)$ を次のように定義します：

<div class="Thm Definition">
$q \in k \setminus \{ 0 \}$ を一つ固定し，4つの元 $\widetilde{E}, \widetilde{F}, \widetilde{K}, \widetilde{K^{-1}}$ から生成されるテンソル代数を $T$ とおく．$T$ を関係式
$$
\begin{align*}
\widetilde{K} \widetilde{K^{-1}} &= \widetilde{K^{-1}} \widetilde{K} = 1, \\
\widetilde{K} \widetilde{E} \widetilde{K^{-1}} &= q^2 \widetilde{E}, \\
\widetilde{K} \widetilde{F} \widetilde{K^{-1}} &= q^{-2} \widetilde{F}, \\
\brk{\widetilde{E}, \widetilde{F}} &= \frac{\widetilde{K} - \widetilde{K^{-1}}}{q - q^{-1}}
\end{align*}
$$
で割った商代数を $U_q (\sl)$ と書き，$\widetilde{E}, \widetilde{F}, \widetilde{K}, \widetilde{K^{-1}}$ に対応する元をそれぞれ $E, F, K, K^{-1}$ と表す．$U_q (\sl)$ は**量子群**（*quantum groups*）と呼ばれるものの1つである．
</div>

このとき $\Delta \colon U_q (\sl) \to U_q (\sl)^{\otimes 2}$ は
$$
\begin{align*}
\Delta (E) &= E \otimes K + 1 \otimes E, \\
\Delta (F) &= F \otimes 1 + K^{-1} \otimes F, \\
\Delta (K^{\pm 1}) &= K^{\pm 1} \otimes K^{\pm 1}
\end{align*}
$$
と変更されます．これはもちろん $\Delta = \tau \circ \Delta$ を満たさないので，$U_q (\sl)$ は非余可換であることが分かります．

# 量子群の表現
以下では $q$ は $1$ の冪根でない，すなわち任意の $p \in \mathbb{Z}_{\ge 1}$ に対して $q^p \neq 1$ であるとします．$1$ の冪根である場合は少し厄介です．詳しくは [Kassel](https://www.springer.com/la/book/9780387943701) を読んでください．

$\sl$ の表現 $(V_m, \rho_m)$ に対応する $U_q (\sl)$ の表現を考えます．（$U_q (\sl)$ は代数なので，代数としての表現です．）そのためには，多項式環 $k [x, y]$ も量子化する必要があります．

今まで $x$ と $y$ は可換でしたが，代わりに $x y = q y x$ を満たすとします．正確に言えば，

<div class="Thm Definition">
2つの元 $\widetilde{x}, \widetilde{y}$ から生成されるテンソル代数 $T$ を関係式
$$
\widetilde{x} \widetilde{y} = q \widetilde{y} \widetilde{x}
$$
で割った商代数を $k_q [x, y]$ と書く．$\widetilde{x}, \widetilde{y}$ に対応する元をそれぞれ $x, y$ と表す．

$k_q [x, y]$ のうち，$m$ 次斉次多項式と $0$ からなる集合を $k_q [x, y]_m$ と書く．
</div>

$k [x, y]$ の場合と同じく，$\{ x^i y^{m - i} \mid 0 \le i \le m \}$ が $k_q [x, y]_m$ の基底であり，ベクトル空間として
$$
k_q [x, y] = \bigoplus_{m = 0}^\infty k_q [x, y]_m
$$
となります．

さて，$U_q (\sl)$ の表現 $(V_m := k_q [x, y]_m, \rho_m)$ を構成しましょう．$U_q (\sl)$ の $V_m$ への作用を，$P (x, y) \in V_m$ に対して
$$
\begin{align*}
(E P) (x, y) &= x \frac{P (x, q y) - P (x, q^{-1} y)}{q - q^{-1}} \cdot \frac{1}{y}, \\
(F P) (x, y) &= \frac{1}{x} \cdot \frac{P (q x, y) - P (q^{-1} x, y)}{q - q^{-1}} y, \\
(K^{\pm 1} P) (x, y) &= P (q^{\pm 1} x, q^{\mp 1} y)
\end{align*}
$$
で定めます．これらが $U_q (\sl)$ 加群になることは，やや面倒な計算ですが，素直に確かめられます．形式的に $q \to 1$ という極限を考えてみると，$E$ と $F$ の作用がおおよそ微分作用素になるので，これが古典論（$U (\sl)$ 加群）の類似であると言えます．

さらに，代数群 $SL_2 := SL (2, k)$ の量子化も考えることができます．ただし $SL_2$ を直接量子化するのではなく，$SL_2$ の $k [x, y]$ への作用を通じて量子化します．詳細は式が長くなるので割愛しますが，これにより $k [x, y]_m$ は $SL_2$ 余加群の構造を持ち，それは実は $\sl$ 加群の構造と双対であると言われます．一方その量子化 $SL_{q, 2} := SL_q (2, k)$ を考えると，$k_q [x, y]_m$ は $SL_{q, 2}$ 余加群となり，それは $U_q (\sl)$ 加群の構造と双対です．


# 終わりに

量子群はその基本だけでも，ここに書ききれないほど多くのおもしろい内容が詰まっています．ぜひその魅力を感じてください！

明日は h6akh さんの sine-square deformation についてです．

長い文章でしたがありがとうございました．


