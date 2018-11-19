
# Lie代数の定義

$k$ を（標数 $0$ の）体とします．物理学では，基本的に $k = \mathbb{R}$ か $k = \mathbb{C}$ の場合のみを考えればよいでしょう．
$k$ 上の**Lie 代数**（*Lie algebra*）とは，$k$ 上のベクトル空間 $\frk g$ であって，交代的な双線型写像 $\brk{\cdot, \cdot} \colon \frk g \times \frk g \to \frk g$ （線型写像 $\brk{\cdot, \cdot} \colon \frk g \wedge \frk g \to \frk g$ と言ってもよい）が存在し，Jacobi恒等式
$$
\brk{x, \brk{y, z}} + \brk{y, \brk{z, x}} + \brk{z, \brk{x, y}} = 0
$$
が任意の $x, y, z \in \frk g$ に対して成り立つものをいいます．Lie 代数 $\frk g$ の**部分 Lie 代数**（*Lie subalgebras*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$
