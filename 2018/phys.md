<link rel="stylesheet" type="text/css" href="preload.css">

$$
\renewcommand\le\leqslant
\newcommand\id{\mathrm{id}}
\newcommand\adef{\stackrel{\mathrm{def}}{\Longleftrightarrow}}
\newcommand\surj\twoheadrightarrow
\newcommand\incl\hookrightarrow
\newcommand\gen[1]{\langle #1 \rangle}
\newcommand\Set{\mathbf{Set}}
\newcommand\Grp{\mathbf{Grp}}
\newcommand\Abl{\mathbf{Abl}}
\newcommand\op{\mathrm{op}}
\newcommand\frk\mathfrak
\newcommand\brk[1]{[ #1 ]}
\DeclareMathOperator\Ker{Ker}
\let\Im\relax
\DeclareMathOperator\Im{Im}
\DeclareMathOperator\Ab{Ab}
\DeclareMathOperator\Coim{Coim}
\DeclareMathOperator\Coker{Coker}
$$

意見や質問，訂正依頼等は

- [GitHub - naughie/math_adventcal](https://github.com/naughie/math_adventcal)
- [Twitter - naughiez](https://twitter.com/naughiez)

のいずれかまでお願いします．

# Lie代数の定義

$k$ を（標数 $0$ の）体とします．物理学では，基本的に $k = \mathbb{R}$ か $k = \mathbb{C}$ の場合のみを考えればよいでしょう．
$k$ 上の**Lie 代数**（*Lie algebra*）とは，$k$ 上のベクトル空間 $\frk g$ であって，交代的な双線型写像 $\brk{\cdot, \cdot} \colon \frk g \times \frk g \to \frk g$ （線型写像 $\brk{\cdot, \cdot} \colon \frk g \wedge \frk g \to \frk g$ と言ってもよい）が存在し，Jacobi恒等式
$$
\brk{x, \brk{y, z}} + \brk{y, \brk{z, x}} + \brk{z, \brk{x, y}} = 0
$$
が任意の $x, y, z \in \frk g$ に対して成り立つものをいいます．Lie 代数 $\frk g$ の**部分 Lie 代数**（*Lie subalgebras*）とは，$\frk g$ の部分空間 $\frk h \subset \frk g$
