
# Lie代数の定義

$k$ を（標数 $0$ の）体とします．物理学では，基本的に $k = \mathbb{R}$ か $k = \mathbb{C}$ の場合のみを考えればよいでしょう．
$k$ 上の**Lie 代数**（*Lie algebra*）とは，$k$ 上のベクトル空間 $\frk g$ であって，交代的な双線型写像 $\brk{\cdot, \cdot} \colon \frk g \times \frk g \to \frk g$ （線型写像 $\brk{\cdot, \cdot} \colon \frk g \wedge \frk g \to \frk g$ と言ってもよい）が存在し，Jacobi恒等式
$$
\brk{x, \brk{y, z}} + \brk{y, \brk{z, x}} + \brk{z, \brk{x, y}} = 0
$$
が任意の $x, y, z \in \frk g$ に対して成り立つものをいいます．

Lie 代数 $\frk g$ の**部分 Lie 代数**（*Lie subalgebras*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$ であって，任意の $x, y \in \frk h$ に対して $\brk{x, y} \in \frk h$ となることをいいます．

Lie 代数 $\frk g$ の**イデアル**（*ideal*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$ であって，任意の $x \in \frk h$ と $y \in \frk g$ に対して $\brk{x, y} \in \frk h$ となることをいいます．容易に分かるように，Lie 代数のイデアルは部分 Lie 代数になります．

Lie 代数間の写像 $\varphi \colon \frk g \to \frk h$ が*** Lie 代数準同型*（*Lie algebra homomorphism*）であるとは，線型写像であって，任意の $x, y \in \frk g$ に対して，
$$
\varphi (\brk{x, y}) = \brk{\varphi (x), \varphi (y)}
$$
となることをいいます．Lie 代数準同型の核はイデアルであり，像は部分 Lie 代数です．

最も身近な Lie 代数の例は $\frk{gl} (n, k)$ でしょう．これは，ベクトル空間としては $k$ 上の $n$ 次行列全体 $M (n, k)$ であり，その上のブラケットを $x, y \in M (n, k)$ に対して
$$
\brk{x, y} := x y - y x
$$
と定めたものです．左辺は行列の積および差です．これが実際に $k$ 上の Lie 代数となることは，簡単な計算によって確かめられます．

同様に，$k$ 上ベクトル空間 $V$ の自己準同型全体 $\End (V)$ に
$$
\brk [f, g] := f \circ g - g \circ f \quad (f, g \in \End (V))
$$
として Lie 代数の構造を入れたものを $\frk{gl} (V)$ と書きます．


<div class="Thm Definition">
$k$ 上 Lie 代数 $\frk g$ の**表現**（*representations*）とは，$k$ 上ベクトル空間 $V$ と Lie 代数準同型 $\rho \colon \frk g \to \frk{gl} (V)$ のペアのことをいう．誤解の恐れがない場合，$V$ や $\rho$ のことを表現と呼ぶこともある．$V$ を**$\frk g$ 加群**（*$\frk g$-module*）ともいう．
</div>

表現には色々な側面がありますが，そのうちの一つは「Lie 代数という抽象的な概念を，$\frk{gl} (V)$ という具体的で扱いやすいものを通じて調べる」ことです．
