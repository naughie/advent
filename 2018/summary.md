---
title: 12/22
---

$$
\DeclareMathOperator\reprho{\stackrel{\rho}{\curvearrowright}}
\DeclareMathOperator\reprhotensor{\stackrel{\rho^{\otimes 2} \Delta}{\curvearrowright}}
\DeclareMathOperator\Func{Func}
$$

## はじめに

去る12月22日（土）に，[\@kyotomathmath](https://twitter.com/kyotomathmath) で Advent Calendar に書いたことに関連して話をしました．ここにその概要を議事録的に残しておこうと思います．本当は可換図式も描ければいいのですが，力尽きてしまいした．

**☡ Remark** は，通称「危険な曲がり角」（dangerous bend）と呼ばれ，比較的発展的な内容であることを指します．


# 群論のコンテクスト For groups

以下では，群と Lie 代数がとても似ていることを確認して，その後量子群や Yang-Baxter 方程式へと踏み込んでいきます．

## 準備 Preliminaries

任意の（空でもよい）集合 $A$ と一点集合 $\{ 1 \}$ に関して次のような全単射があることに注意します：
$$
\begin{align*}
A \times \{ 1 \} \cong A \cong \{ 1 \} \times A.
\end{align*}
$$
ここで，$\cong$ は全単射があることを意味しています．この対応は
$$
\begin{align*}
(x, 1) \mapsto x \mapsto (1, x)
\end{align*}
$$
で与えられます．

そこで，上の全単射をすべて同じ記号 $\iota$ で表すことにします：

- $\iota \colon A \times \{ 1 \} \to A$,
- $\iota \colon A \to A \times \{ 1 \}$,
- $\iota \colon \{ 1 \} \times A \to A$,
- $\iota \colon A \to \{ 1 \} \times A$.

恐らくどの $\iota$ を使っているかは文脈で判断できるでしょう．

圏論では，これらの全単射を（集合の圏における）**自然同型**（*natural isomorphism*）と言います．

さらに，任意の集合 $A$ と $B$ に関して次の全単射（自然同型）があります：
$$
\begin{align*}
&\tau \colon A \times B \to B \times A, \\
&\tau (x, y) := (y, x).
\end{align*}
$$
これも，$A, B$ を明示せず単に $\tau$ と書きます．

## 群における写像たち Maps in the definition of groups

[日曜数学 Advent Calendar](https://home.naughie.net/advent/2018/math.html) で触れたように，**群**（*groups*）は次のように定義できます：

- 集合 $G$；
- 写像 $\mu \colon G \times G \to G$ such that $\mu \circ (\mu \times \id_G) = \mu \circ (\id_G \times \mu)$；
- 写像 $\eta \colon \{ 1 \} \to G$ such that $\mu \circ (\eta \times \id_G) = \iota = \mu \circ (\id_G \times \eta)$；
- 写像 $S \colon G \to G$ such that $\mu \circ (S \times \id_G) \circ \Delta = \eta \circ \varepsilon = \mu \circ (\id_G \times S) \circ \Delta$．

ここで，$\Delta \colon G \to G \times G$ と $\varepsilon \colon G \to \{ 1 \}$ は次で定まる写像です：
$$
\begin{align*}
\Delta (x) &:= (x, x), \\
\varepsilon (x) &:= 1.
\end{align*}
$$

そして**可換群**（*commutative groups*）とは，群 $G$ であって，$\mu = \mu \circ \tau$ であるようなもののことです．

<div class="Thm Definition">
群 $(G, \mu_G, \eta_G, S_G)$ と $(H, \mu_H, \eta_H, S_H)$ の間の写像 $\varphi \colon G \to H$ が**群準同型**（*group homomorphism*）であるとは，次の条件を満たすことをいう：

- $\mu_H \circ (\varphi \times \varphi) = \varphi \circ \mu_G$；
- $\eta_H = \varphi \circ \eta_G$；
- $S_H \circ \varphi = \varphi \circ S_G$．
</div>

<div class="Thm Definition">
群 $(G, \mu_G, \eta_G, S_G)$ と $(H, \mu_H, \eta_H, S_H)$ の間の写像 $\varphi \colon G \to H$ が**反群準同型**（*group anti-homomorphism*）であるとは，次の条件を満たすことをいう：

- $\mu_H \circ (\varphi \times \varphi) = \varphi \circ \mu_G \circ \tau$；
- $\eta_H = \varphi \circ \eta_G$；
- $S_H \circ \varphi = \varphi \circ S_G$．
</div>

群論でよく知られているように，$\Delta$ と $\varepsilon$ は群準同型であり，$S$ は反群準同型です．

<div class="Thm DBend">
一点集合，直積集合，直積写像はすべて圏論的な概念であり，**集合の元の表示を使わずに**定義できます．
</div>

<div class="Thm DBend">
任意の集合 $A$ と上のように定まる写像 $\Delta \colon A \to A \times A$，$\varepsilon \colon A \to \{ 1 \}$ に対して，次の式が成り立ちます：

- $(\Delta \times \id_A) \circ \Delta = (\id_A \times \Delta) \circ \Delta$，
- $(\varepsilon \times \id_A) \circ \Delta = \iota = (\id_A \times \varepsilon) \circ \Delta$．
</div>

<div class="Thm DBend">
群 $G$ の表現 $G \reprho V$ を考えます．$G$ 上の写像 $\Delta$ を使えば，表現 $G \reprhotensor V^{\otimes 2}$ を構成できます．ここで，${}^{\otimes 2}$ は同じもの2つのテンソル積を表します（*e.g.* $V^{\otimes 2} = V \otimes V$，$\varphi^{\otimes 2} = \varphi \otimes \varphi$）．
</div>

以上の定義では，「集合」と「写像」しか現れていないことに注意してください．

# Hopf 代数のコンテクスト For Hoph algebras

体 $k$ を固定します．体に慣れていないなら $k = \mathbb{R}, \mathbb{C}$ のときを考えればよいです．

今までの話において，次のような置き換えを実行します：

- 集合 → ベクトル空間
- 写像 → 線型写像
- 全単射 → 線型同型
- 直積 → テンソル積
- 一点集合 → $k$

すると Hopf 代数と呼ばれるものが出てきます．

## 準備

$V$ を $k$ 上ベクトル空間としたとき，集合の場合と同様に次の線型同型があります：
$$
\begin{align*}
V \otimes k \cong V \cong k \otimes V.
\end{align*}
$$
$\cong$ はやはり線型同型を表す記号で，この線型同型は具体的に
$$
\begin{align*}
x \otimes 1 \mapsto x \mapsto 1 \otimes x
\end{align*}
$$
で与えられます．これも自然同型となります．これらの線型写像をすべて $\iota$ と書きます．

そして $k$ 上ベクトル空間 $V, W$ に対して，
$$
\begin{align*}
&\tau \colon V \otimes W \to W \otimes V, \\
&\tau (x \otimes y) := y \otimes x
\end{align*}
$$
という線型同型（自然同型）もあります．

## Hopf 代数の定義 Definition of Hopf algebras

群の場合とのアナロジーをよく意識してください．

<div class="Thm Definition">
$k$ 上の**代数**（*algebras*）とは，次の組のことである：

- $k$ 上ベクトル空間 $A$；
- 線型写像 $\mu \colon A \otimes A \to A$ such that $\mu \circ (\mu \otimes \id_A) = \mu \circ (\id_A \otimes \mu)$；
- 線型写像 $\eta \colon k \to A$ such that $\mu \circ (\eta \otimes \id_A) = \iota = \mu \circ (\id_A \otimes \eta)$．
</div>

例えば，$k$ は $k$ 上代数です：
$$
\begin{align*}
\mu (x \otimes y) &:= x y, \\
\eta (\alpha) &:= \alpha.
\end{align*}
$$

<div class="Thm Definition">
$(A, \mu_A, \eta_A)$ と $(B, \mu_B, \eta_B)$ を $k$ 上の代数とする．代数の間の線型写像 $\varphi \colon A \to B$ が**代数準同型**（*algebra homomorphism*）であるとは，次の条件を満たすことをいう：

- $\mu_B \circ (\varphi \otimes \varphi) = \varphi \circ \mu_A$；
- $\eta_B = \varphi \circ \eta_A$．

線型写像 $\varphi \colon A \to B$ が**反代数準同型**（*algebra anti-homomorphism*）であるとは，次の条件を満たすことをいう：

- $\mu_B \circ (\varphi \otimes \varphi) = \varphi \circ \mu_A \circ \tau$；
- $\eta_B = \varphi \circ \eta_A$．
</div>

<div class="Thm Definition">
$k$ 上の**余代数**（*coalgebras*）とは，次の組のことである：

- $k$ 上ベクトル空間 $C$；
- 線型写像 $\Delta \colon C \to C \otimes C$ such that $(\Delta \otimes \id_C) \circ \Delta = (\id_C \otimes \Delta) \circ \Delta$；
- 線型写像 $\varepsilon \colon C \to k$ such that $(\varepsilon \otimes \id_C) \circ \Delta = \iota = (\id_C \otimes \varepsilon) \circ \Delta$．
</div>

例えば，$k$ は $k$ 上余代数です：
$$
\begin{align*}
\Delta (x) &:= x \otimes 1 = 1 \otimes x, \\
\varepsilon (x) &:= x.
\end{align*}
$$

<div class="Thm Definition">
$k$ 上の**双代数**（*bialgebras*）とは，次の組のことである：

- $k$ 上のベクトル空間 $B$；
- $(B, \mu, \eta)$ が $k$ 上の代数；
- $(B, \Delta, \varepsilon)$ が $k$ 上の余代数；
- $\Delta \colon B \to B \otimes B$ と $\varepsilon \colon B \to k$ がともに代数準同型．
</div>

ここで，$B \otimes B$ には自然な代数の構造を入れ，$k$ には上で述べた代数の構造を入れます．

<div class="Thm Definition">
$k$ 上の **Hopf 代数**（*Hopf algebras*）とは，次の組のことである：

- $k$ 上のベクトル空間 $H$；
- $(H, \mu, \eta, \Delta, \varepsilon)$ が $k$ 上の双代数；
- 線型写像 $S \colon H \to H$ such that $\mu \circ (S \otimes \id_H) \circ \Delta = \eta \circ \varepsilon = \mu \circ (\id_H \otimes S) \circ \Delta$．
</div>

Hopf 代数の $S$ について，群論と対応した次の命題があります：

<div class="Thm Proposition">
$k$ 上の双代数 $(H, \mu, \eta, \Delta, \varepsilon)$ に対して，$\mu \circ (S \otimes \id_H) \circ \Delta = \eta \circ \varepsilon = \mu \circ (\id_H \otimes S) \circ \Delta$ を満たすような線型写像 $S \colon H \to H$ は，存在すれば一意である．

さらに，そのような $S$ は反代数準同型となる．
</div>

# 表現論と量子群

## Hopf 代数の例

まず $k$ 上 Lie 代数 $\frk g$ を取り，その**普遍包絡環**（*universal enveloping algebra*）$U (\frk g)$ を考えます．名前から想像できる通り $U (\frk g)$ は $k$ 上の代数ですが，実は Hopf 代数にもなります．
それを確認するために，$U (\frk g)$ の表現 $U (\frk g) \reprho V$ があるときにテンソル積表現 $U (\frk g) \reprhotensor V^{\otimes 2}$ を構成する方法を思い出しましょう．（知らないのであれば，たとえば [Humphreys](https://www.springer.com/us/book/9780387900537) を読むといいです．）代数準同型 $\Delta \colon U (\frk g) \to U (\frk g) \otimes U (\frk g)$ を
$$
\Delta (X) := X \otimes 1 + 1 \otimes X \quad (X \in \frk g)
$$
と定義します．すると，$(\varepsilon \otimes \id_C) \circ \Delta = \iota = (\id_C \otimes \varepsilon) \circ \Delta$ であるためには $\varepsilon (X) := 0$ ($X \in \frk g$) と定義しなければならないことが分かります．そして $\mu \circ (S \otimes \id_H) \circ \Delta = \eta \circ \varepsilon = \mu \circ (\id_H \otimes S) \circ \Delta$ であるためには $S (X) := - X$ ($X \in \frk g$) と定義しなければならないことも分かります．

逆に，このように定めた $(U (\frk g), \mu, \eta, \Delta, \varepsilon, S)$ は Hopf 代数になります．

別の Hopf 代数の例として，群 $G$ 上の関数環
$$
H = \Func (G) := \{ f \colon G \to k \colon \text{map} \}
$$
があります．$G$ の群構造と $k$ の Hopf 代数の構造を上手く使うことで，次のように構造射を定義します：

- $\mu (f \otimes g) (x) := f (x) g (x)$；
- $\eta (\alpha) (x) := \alpha$；
- $\Delta (f) (x, y) := f (x y)$；
- $\varepsilon (f) := f (1)$；
- $S (f) (x) := f (x^{-1})$．

これによって，$H$ は Hopf 代数となります．

<div class="Thm DBend">
この「$G$ の群構造と $k$ の Hopf 代数構造から $H$ の Hopf 代数構造が定まる」ということは，圏論で一般化することができます．
</div>

## 量子群

群 $G$ では当然 $\Delta = \tau \circ \Delta$ が成り立っていました．普遍包絡環でも $\Delta = \tau \circ \Delta$ が分かります．

一方で $\Func (G)$ では，$G$ が可換（$\mu = \mu \circ \tau$）なとき，かつそのときに限り $\Delta = \tau \circ \Delta$ が成り立ちます．

$\Delta \neq \tau \circ \Delta$ でも，その特別な場合が Yang-Baxter 方程式を解く鍵となります．

<div class="Thm Definition">
$H$ を $k$ 上の Hopf 代数とする．$H$ が *braided* であるとは，ある $R \in H \otimes H$ が存在して，次の条件を満たすことをいう：

- 任意の $x \in H$ に対して $\tau \circ \Delta (x) = R \Delta (x) R^{-1}$；
- $(\Delta \otimes \id_H) (R) = R_{13} R_{23}$；
- $(\id_H \otimes \Delta) (R) = R_{13} R_{12}$．

ここで，$R_{12}, R_{13}, R_{23} \in H^{\otimes 3}$ は
$$
\begin{align*}
R_{12} &:= R \otimes 1, \\
R_{13} &:= (\id_H \otimes \tau) (R \otimes 1), \\
R_{23} &:= 1 \otimes R
\end{align*}
$$
で定義される．

この $R$ を *universal $R$-matrix* という．
</div>

この定義は $\frk{S}_3$ における Coxeter relations を意識したものになっています：
$$
(1 \ 2) (2 \ 3) (1 \ 2) = (2 \ 3) (1 \ 2) (2 \ 3).
$$

説明は省略しますが，これと双対な universal $R$-forms と呼ばれるものがあり，次の驚くべき主張が成り立ちます（Faddeev-Reshetikhin-Takhtadjian）：

<div class="Thm Theorem">
有限次元の Yang-Baxter 方程式の解はすべて universal $R$-form から構成することができる．
</div>
