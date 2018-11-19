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

# 群論の復習 Review of group theory

まず，群論の記法を思い出しましょう．本稿を理解する上で，ここに書いてあることをすべて知っている必要はないですが，十分に慣れていることを想定しています．

最初は[圏論的群論](#圏論的群論-categorical-group-theory)を読み進めて，後で知らない概念や記号が出てきたときに確認する程度でも構いません．

Mathjax の処理に時間がかかるため，[別のページ](groups.html)に用意しています．

# 圏論的群論 Categorical group theory

## 群の定義 Definition of groups

圏論では，具体的な元を用いずに，射（写像や群準同型）のみを用いて話を進めます．そこでまずは，群の定義を射のみを用いて書き換えていきましょう．

### 積の公理 Axiom of the multiplication

$G$ を群としたときに，その積は，写像 $\mu \colon G \times G \to G$ であって，結合律を満たすことが要求されます．結合律は次の可換図式で表されます：
$$
\begin{CD}
G \times G \times G @>\id_G \times \mu>> G \times G \\
@V\mu \times \id_GVV @VV\mu{}V \\
G \times G @>>\mu> G
\end{CD}
$$

（ここで，$G \times G$ や $\id_G \times \mu$ 等は**集合の直積**に関する普遍性から出てきます．しかし，そこまで説明すると長くなるので省略します．）

これが積の結合律を表していることは，次の計算で確かめることができます：
$$
\begin{align*}
\mu \circ (\id_G \times \mu) (f, g, h) &= \mu (f, \mu (g, h)) = \mu (f, g h) = f (g h), \\
\mu \circ (\mu \times \id_G) (f, g, h) &= \mu (\mu (f, g), h) = \mu (f g, h) = (f g) h.
\end{align*}
$$

### 単位元の公理 Axiom of the unit

次に群の単位元を射で表します．そのために，次の命題が成り立つことに注意します：

#### Prop
<div class="Thm Proposition">

$G$ を群とすると，群準同型 $\{ 1 \} \to G$ が**ただ一つ**存在する．
</div>

この群準同型を $\eta \colon \{ 1 \} \to G$ とおくと，群準同型の定義から，$\eta (1) = 1$ であることが分かります．そこで，**$G$ の単位元 $1 \in G$ と群準同型 $\eta \colon \{ 1 \} \to G$ を同一視**してみましょう．より正確には，次のようなプロセスを経ます：

1. 一般に，**写像** $\varphi \colon \{ 1 \} \to X$ は，その値 $\varphi (1) \in X$ によって完全に決定される．すなわち，写像 $\varphi \colon \{ 1 \} \to X$ と $X$ の元との間に一対一対応（全単射）が存在する．これによって，写像 $\varphi \colon \{ 1 \} \to X$ とその値 $\varphi (1) \in X$ とを同一視する．
1. 特に $X = G$ として，写像 $\varphi \colon \{ 1 \} \to G$ と値 $\varphi (1) \in G$ を同一視する．
1. $\varphi = \eta \colon \{ 1 \} \to G$ が群準同型であることから，自動的に $\eta (1) = 1$ となる．これにより，群準同型 $\eta \colon \{ 1 \} \to G$ と単位元 $1 \in G$ を同一視する．

この同一視を用いて単位元の公理 $g \cdot 1 = g = 1 \cdot g$ を表すと，$\mu (g, \eta (1)) = \id_G (g) = \mu (\eta (1), g)$ であることから，
$$
\begin{CD}
\{ 1 \} \times G @>\eta \times \id_G>> G \times G @<\id_G \times \eta<< G \times \{ 1 \} \\
@V\pi_2VV @VV\mu{}V @VV\pi_1V \\
G @= G @= G
\end{CD}
$$
という可換図式を得ます．ここで，$\pi_1 \colon \{ 1 \} \times G \to G$ や $\pi_2 \colon G \times \{ 1 \} \to G$ は標準的な射影です．

もしかしたら，「$\{ 1 \}$ が具体的な元を用いて定義されているから，圏論的でないのではないか」と思う人もいるかもしれません．しかし，$\{ 1 \}$ は，集合の終対象として，ちゃんと圏論的に特徴づけることができます．

### 逆元の公理 Axiom of the inverse elements

逆元はやや複雑です．逆元を表す写像を $S \colon G \to G, x \mapsto x^{-1},$ とおき，$S$ を射によって特徴づけてみます．まず注意してほしいこととして，$S$ は群準同型では**ありません**！実際，$g, h \in G$ を任意に取ってきたときに，
$$
\begin{align*}
S (g h) &= (g h)^{-1} = h^{-1} g^{-1}, \\
S (g) S (h) &= g^{-1} h^{-1}
\end{align*}
$$
なので，$G$ が非可換ならば一般に $S (gh) \neq S (g) S (h)$ です．しかし，この計算から分かるように，$S \colon G \to G$ は反群準同型です：

#### Def
<div class="Thm Definition">

群の間の写像 $\varphi \colon G \to H$ が**反群準同型**（*group anti-homomorphism*）であるとは，

- $\varphi (1) = 1$；
- 任意の $g, h \in G$ に対して $\varphi (g h) = \varphi (h) \varphi (g)$；
- 任意の $g \in G$ に対して $\varphi (g^{-1}) = \varphi (g)^{-1}$

となることをいう．
</div>

上の命題と双対的なものとして，次の命題も重要です：

#### Prop
<div class="Thm Proposition">

$G$ を群とすると，群準同型 $G \to \{ 1 \}$ が**ただ一つ**存在する．
</div>

この群準同型を $\varepsilon \colon G \to \{ 1 \}$ と書きましょう．もちろん $\varepsilon (g) = 1$ です．これを使えば，単位元 $1 \in G$ を，群準同型 $\eta \circ \varepsilon \colon G \to G$ によって述べることもできます．

**対角写像**（*diagonal mapping*）と呼ばれる群準同型 $\Delta \colon G \to G \times G, \ g \mapsto (g, g),$ も便利です．

さて，以上の写像 $S, \mu, \eta, \Delta, \varepsilon$ によって，逆元の公理 $g \cdot g^{-1} = 1 = g^{-1} \cdot g$ を可換図式で表します：
$$
\begin{CD}
G \times G @<\Delta<< G @>\Delta>> G \times G \\
@V\id_G \times SVV @VV\eta \circ \varepsilon{}V @VVS \times \id_GV \\
G \times G @>>\mu> G @<<\mu< G \times G
\end{CD}
$$
一番左側が $g \mapsto (g, g) \mapsto (g, g^{-1}) \mapsto g \cdot g^{-1}$ を，真ん中が $g \mapsto 1 \in \{ 1 \} \mapsto 1 \in G$ を，一番右が $g \mapsto (g, g) \mapsto (g^{-1}, g) \mapsto g^{-1} \cdot g$ を表しています．

### 群の圏論的定義 Categorical definition of groups

今，逆に，**集合** $G$ と**写像** $\mu \colon G \times G \to G$，$\eta \colon \{ 1 \} \to G$，$S \colon G \to G$ が与えられて，しかも以下の可換図式を満たすとしましょう：
$$
\begin{CD}
G \times G \times G @>\id_G \times \mu>> G \times G \\
@V\mu \times \id_GVV @VV\mu{}V \\
G \times G @>>\mu> G
\end{CD}
$$
$$
\begin{CD}
\{ 1 \} \times G @>\eta \times \id_G>> G \times G @<\id_G \times \eta<< G \times \{ 1 \} \\
@V\pi_2VV @VV\mu{}V @VV\pi_1V \\
G @= G @= G
\end{CD}
$$
$$
\begin{CD}
G \times G @<\Delta<< G @>\Delta>> G \times G \\
@V\id_G \times SVV @VV\eta \circ \varepsilon{}V @VVS \times \id_GV \\
G \times G @>>\mu> G @<<\mu< G \times G
\end{CD}
$$
ここで，写像 $\Delta \colon G \to G \times G, \ g \mapsto (g, g)$ と $\varepsilon \colon G \to \{ 1 \}$ は，**一般の集合に対して**定義できる写像です．

このとき，$G$ 上の積を $g \cdot h := \mu (g, h)$ と定めれば，$G$ は $\eta (1)$ を単位元とし，$g \in G$ の逆元が $S (g)$ であるような群となることが分かります．（写像 $\eta \colon \{ 1 \} \to G$ の存在から，特に $G \neq \emptyset$ も言えます．）従って，**上の可換図式を満たすような集合 $G$ と写像 $\mu \colon G \times G \to G$，$\eta \colon \{ 1 \} \to G$，$S \colon G \to G$ のペア**のことを群と呼んでも問題なさそうです．

以上で，群を射のみによって定義することができました．

## 準同型とその核 Homomorphisms and kernels

続いて，準同型を圏論的に定式化しましょう．

#### Prop
<div class="Thm Proposition">

$(G, \mu_G, \eta_G, S_G)$ と $(H, \mu_H, \eta_H, S_H)$ を群とする．写像 $\varphi \colon G \to H$ が**群準同型**（*group homomorphism*）であるための必要十分条件は，

- $\varphi \circ \eta_G = \eta_H \colon \{ 1 \} \to H$；
- $\varphi \circ \mu_G = \mu_H \circ (\varphi \times \varphi) \colon G \times G \to H$；
- $\varphi \circ S_G = S_H \circ \varphi \colon G \to H$

となることである．
</div>

準同型 $\varphi \colon G \to H$ の核 $\Ker (\varphi)$ を圏論的に定式化するために，準同型の核についてもう少し詳しく考えてみましょう．今，
$$
\begin{align*}
g \in \Ker (\varphi) &\adef \varphi (g) = 1 \\
&\Longleftrightarrow \varphi (g) = \eta \circ \varepsilon (g)
\end{align*}
$$
なので，

- $\Ker (\varphi)$ は，$G$ の部分集合 $S \subset G$ であって，$\varphi |_S = \eta \circ \varepsilon |_S$ を満たすもののうち，最大のもの

と表すことができます．これでめでたく，$\Ker (\varphi)$ の定義から元の記述を消すことができました！しかし，この「最大」というのはあまり扱いやすくありません．

$G$ の部分集合 $S, T \subset G$ について，$S \subset T$ であることと，包含写像（inclusion）$\iota \colon S \incl T$ が存在することは同値です．従って，

- $\Ker (\varphi)$ は，$\varphi |_{\Ker (\varphi)} = \eta \circ \varepsilon |_{\Ker (\varphi)}$ であり，$\varphi |_S = \eta \circ \varepsilon |_S$ なる任意の部分集合 $S \subset G$ に対して，包含写像 $S \incl \Ker (\varphi)$ が存在する

と言えます．これをもう少し進めて，次のように $\Ker (\varphi)$ を特徴づけます（MathJax の仕様上，適切な可換図式を書くことができないのが残念です）：

#### Thm
<div class="Thm Theorem">

群の間の群準同型 $\varphi \colon G \to H$ が与えられたとき，次の条件を満たす群 $K$ と群準同型 $\iota \colon K \to G$ のペアが同型を除いて**一意に**存在する：

- $\varphi \circ \iota = \eta_H \circ \varepsilon_K$；
- $\varphi \circ \iota' = \eta_H \circ \varepsilon_{K'}$ なる任意の群 $K'$ と群準同型 $\iota' \colon K' \to G$ のペアに対して，ただ一つの群準同型 $\widetilde{\iota'} \colon K' \to K$ が存在して $\iota' = \iota \circ \widetilde{\iota'}$ とできる．
</div>

核 $\Ker (\varphi)$ と包含写像 $\iota \colon \Ker (\varphi) \incl G$ のペアは，この定理の $(K, \iota)$ の条件を満たすので，これにより**核を（同型を除いて）決定することができます**．そこで，この定理を**核の普遍性**（*universal property of kernels*）といいます．

具体的な元を一切使わずに，射のみによって核を定義することは，非常に素晴らしいことです！核があれば，正規部分群も定義できます．（$\Ker (\varphi)$ は $G$ の正規部分群であり，正規部分群はある準同型の核になっている．）そうすると剰余群もまた定義することができます．余裕のある人は確かめてほしいのですが，群論だけでなく，環やベクトル空間，位相空間等でもまったく同じ話が成り立ちます．そこでは，正規部分群と（両側）イデアル，線形部分空間が同じ役割を担っていることを見るでしょう．圏論による抽象化の威力の一旦を垣間見ます．

さて，最初なので普遍性を証明してみましょう．この手の主張の証明は，ほとんどの場合，「（少なくとも一つ）存在すること」と「（存在すれば）高々一つであること」の二つを独立に示します．

#### Proof
<div class="Proof">

**存在性**

$(\Ker (\varphi), \iota \colon \Ker (\varphi) \incl G)$ が条件を満たすことを見る．群 $K'$ と群準同型 $\iota' \colon K' \to G$ であって，$\varphi \circ \iota' = \eta_H \circ \varepsilon_{K'}$ なるものを任意に取る．各 $g' \in K'$ に対して $\iota' (g') = \eta_H \circ \varepsilon_{K'} (g') = 1$ より，$\iota' (g') \in \Ker (\varphi)$．よって，$\widetilde{\iota'} \colon K' \to \Ker (\varphi)$ を，$\widetilde{\iota'} (g') := \iota (g) \in \Ker (\varphi)$ で定義すれば，$\widetilde{\iota'} \colon K' \to \Ker (\varphi)$ は群準同型で $\iota' = \iota \circ \widetilde{\iota'}$ となる．

さらに，$\iota' = \iota \circ \psi$ なる群準同型 $\psi \colon K' \to \Ker (\varphi)$ がもう一つあったする．$\widetilde{\iota'} = \psi$ を示したいが，任意の $g' \in K'$ に対して，
$$
\begin{align*}
\psi (g') &= \iota \circ \psi (g') &\quad& \text{（$\psi (g') \in \Ker (\varphi)$ だから）} \\
&= \iota \circ \widetilde{\iota'} (g') &\quad& \text{（$\iota \circ \psi = \iota' = \iota \circ \widetilde{\iota'}$ だから）} \\
&= \widetilde{\iota'} (g') &\quad& \text{（$\widetilde{\iota'} (g') \in \Ker (\varphi)$ だから）}
\end{align*}
$$
となるから，$\psi = \widetilde{\iota'}$．

以上より，$(\Ker (\varphi), \iota)$ が条件を満たすことが分かった．

**一意性**

$(K_1, \iota_1), (K_2, \iota_2)$ を，ともに条件を満たす群と群準同型のペアとする．このとき，$\varphi \circ \iota_2 = \eta_H \circ \varepsilon_{K_2}$ であるから，$K_1$ の普遍性より，ある群準同型 $\widetilde{\iota_2} \colon K_2 \to K_1$ が存在して，$\iota_2 = \iota_1 \circ \widetilde{\iota_2}$ とできる．同様に，$K_2$ の普遍性から，ある群準同型 $\widetilde{\iota_1} \colon K_1 \to K_2$ が存在して，$\iota_1 = \iota_2 \circ \widetilde{\iota_1}$ とできる．このとき，$\widetilde{\iota_2} \circ \widetilde{\iota_1} \colon K \to K$ は群準同型であり，
$$
\begin{align*}
\iota_1 \circ (\widetilde{\iota_2} \circ \widetilde{\iota_1}) = (\iota_1 \circ \widetilde{\iota_2}) \circ \widetilde{\iota_1} = \iota_2 \circ \widetilde{\iota_1} = \iota_1
\end{align*}
$$
が成り立つ．一方，恒等写像 $\id_{K_1} \colon K_1 \to K_1$ もまた群準同型であって $\iota_1 \circ \id_{K_1} = \iota_1$ を満たす．よって，再び $K_1$ の普遍性より，$\widetilde{\iota_2} \circ \widetilde{\iota_1} = \id_{K_1}$ を得る．$K_1$ と $K_2$ を入れ替えて同じ議論をすることで，$\widetilde{\iota_1} \circ \widetilde{\iota_2} = \id_{K_2}$ を得る．すなわち，$K_1 \cong K_2$．
<span class="ProofQED"></span>
</div>

## その他の普遍性 Other universalities

### 剰余群 Residue groups

まず剰余群とは何かについて考えましょう．剰余群とは，群 $G$ の正規部分群 $N \vartriangleleft G$ があったときに $G$ を $N$ で割ったもの $G / N$ ですが，上で注意したように，ある群準同型 $\varphi \colon G \to H$ があって $N = \Ker (\varphi)$ なので（例えば $H = G / N$ として，$\varphi = \pi \colon G \surj G / N$ を標準的な全射とすればよいです），初めから $G / \Ker (\varphi)$ というものを考えることにします．この $\Coim (\varphi) := G / \Ker (\varphi)$ を $\varphi$ の**余像**（*coimage*）といいます．

では $\Coim (\varphi)$ とは何でしょうか．$G$ の異なる元 $g, h \in G$ が $\varphi (g) = \varphi (h)$ であるとき，これらの元を「$\varphi$ 無駄」（数学用語ではありません）と呼ぶことにすれば，$\Ker (\varphi)$ は $G$ の $\varphi$ 無駄を集めてきたものなので，$\Coim (\varphi)$ は「$G$ の $\varphi$ 無駄を過不足なく潰したもの」となります．（そもそも剰余群 $\fallingdotseq$ 商集合とはそういうものでした．）

従って $\varphi$ 無駄の無い $\Coim (\varphi)$ は $\Im (\varphi)$ と同一視できると期待できますが，実際にそうだというのが（第一）準同型定理の主張です．

ではこの「$\varphi$ 無駄の無さ」を圏論的にどう表現すればよいのでしょうか．$\Ker (\varphi)$ の場合に倣って，群 $\Coim (\varphi)$ と群準同型 $\pi \colon G \surj \Coim (\varphi)$ のペアとして考えていきましょう．$\Coim (\varphi)$ について今知っていることは，

- $\pi \colon G \surj \Coim (\varphi)$ は全射群準同型；
- ある群準同型 $\widetilde\varphi \colon \Coim (\varphi) \to H$ が存在し，$\widetilde\varphi \circ \pi = \varphi$ となる

ことです．

そこで，別の群 $C'$ と群準同型 $\pi' \colon G \to C'$ のペアであって，

- $\pi' \colon G \to C'$ は全射群準同型；
- ある群準同型 $\widetilde\varphi' \colon C' \to H$ が存在し，$\widetilde\varphi' \circ \pi' = \varphi$ となる

であるとしましょう．核との類推によると，ただ一つの群準同型 $\widetilde{\pi'} \colon C' \to \Coim (\varphi)$ が存在して，$\pi = \widetilde{\pi'} \circ \pi'$ かつ $\widetilde\varphi' = \widetilde\varphi \circ \widetilde{\pi'}$ となると予想できます．

この群準同型 $\widetilde{\pi'} \colon C' \to C$ を構成するために，まず $\Ker (\pi') \subset \Ker (\varphi)$ に注意しましょう．すると，群準同型 $\pi_0 \colon G / \Ker (\pi') \to G / \Ker (\varphi) = \Coim (\varphi)$ が
$$
\pi_0 (g \Ker (\pi')) := g \Ker (\varphi)
$$
によって well-defined に定まります．さらに準同型定理によって群同型 $\pi_1 \colon C' \to G / \Ker (\pi')$ が存在するので，
$$
\widetilde{\pi'} := \pi_0 \circ \pi_1
$$
とおけば，必要な条件をすべて満たすことが分かります．従って次の**余像の普遍性**（*universal property of coimages*）を得ます：

#### Thm
<div class="Thm Theorem">

群の間の群準同型 $\varphi \colon G \to H$ が与えられたとき，次の条件を満たす群 $C$ と全射群準同型 $\pi \colon G \to C$ のペアが同型を除いて一意に存在する：

- ある群準同型 $\widetilde\varphi \colon C \to H$ が存在して，$\varphi = \widetilde\varphi \circ \pi$；
- 任意の群 $C'$ と全射群準同型 $\pi' \colon G \to C'$ のペアであって，ある群準同型 $\widetilde\varphi' \colon C' \to H$ が存在して $\varphi = \widetilde\varphi' \circ \pi'$ とできるものに対して，ただ一つの群準同型 $\widetilde{\pi'} \colon C' \to C$ が存在して，$\pi = \widetilde{\pi'} \circ \pi'$ かつ $\widetilde\varphi' = \widetilde\varphi \circ \widetilde{\pi'}$ となる．
</div>

### 全射と単射 Surjections and injections

次に，全射を圏論的に書き換えましょう．写像 $\varphi \colon X \to Y$ が**全射**（*surjection*）であるとは，
$$
\forall y \in Y, \ \exists x \in X, \ y = \varphi (x)
$$
となることです．一方，圏論では次のような定義があります：

#### Def
<div class="Thm Definition">

写像 $\varphi \colon X \to Y$ が**エピ射**（*epimorphism*）であるとは，任意の写像 $\psi_1, \psi_2 \colon Y \to Z$ に対して，$\psi_1 \circ \varphi = \psi_2 \circ \varphi$ ならば $\psi_1 = \psi_2$ なることをいう．
$$
\forall \psi_1, \psi_2 \colon Y \to Z, \ \psi_1 \circ \varphi = \psi_2 \circ \varphi \Longrightarrow \psi_1 = \psi_2
$$
</div>

一般にこれらは一致しませんが，集合の圏等の特別な場合には一致します．群の圏もその一つです．すなわち，

#### Prop
<div class="Thm Proposition">

群準同型 $\varphi \colon G \to H$ に対して，$\varphi$ が全射であるための必要十分条件は $\varphi$ がエピ射であることである．
$$
\varphi \colon \text{surj.} \Longleftrightarrow \varphi \colon \text{epi.}
$$
</div>

#### Proof
<div class="Proof">

$\Longrightarrow$)

$\varphi$ を全射とし，$\psi_1 \circ \varphi = \psi_2 \circ \varphi$ なる任意の群準同型 $\psi_1, \psi_2 \colon H \to H'$ を取る．このとき，各 $h \in H$ に対して，$h = \varphi (g)$ となるような $g \in G$ を選べば，
$$
\psi_1 (h) = \psi_1 (\varphi (g)) = \psi_2 (\varphi (g)) = \psi_2 (h)
$$
となるから，$\psi_1 = \psi_2$．よって，$\varphi$ はエピ射．

$\Longleftarrow$)

$\varphi$ をエピ射とし，次のような群準同型 $\psi_1, \psi_2 \colon H \to H / \Im (\varphi)$ を考える：
$$
\begin{align*}
\psi_1 (h) &:= h \Im (\varphi), \\
\psi_2 (h) &:= \Im (\varphi).
\end{align*}
$$
容易に分かるように $\psi_1 \circ \varphi = \psi_2 \circ \varphi$ だから，$\varphi$ のエピ性より，$\psi_1 = \psi_2$．これは任意の $h \in H$ に対して $h \Im (\varphi) = \Im (\varphi)$ であること，すなわち $h \in \Im (\varphi)$ であることを導く．よって $\varphi$ は全射となる．
<span class="ProofQED"></span>
</div>

この証明に出てきた $\Coker (\varphi) := H / \Im (\varphi)$ は**余核**（*cokernel*）と呼ばれ，核と圏論的に双対的な概念です．

ついでなので単射についても見てみましょう．写像 $\varphi \colon X \to Y$ が**単射**（*injection*）であるとは，
$$
\forall x_1, x_2 \in X, \ x_1 \neq x_2 \Longrightarrow \varphi (x_1) \neq \varphi (x_2)
$$
となることです．圏論では，

#### Def
<div class="Thm Definition">

写像 $\varphi \colon X \to Y$ が**モノ射**（*monomorphism*）であるとは，任意の写像 $\psi_1, \psi_2 \colon Z \to X$ に対して，$\varphi \circ \psi_1 = \varphi \circ \psi_2$ ならば $\psi_1 = \psi_2$ なることをいう．
$$
\forall \psi_1, \psi_2 \colon Z \to X, \ \varphi \circ \psi_1 = \varphi \circ \psi_2 \Longrightarrow \psi_1 = \psi_2
$$
</div>

これらも一般には一致しませんが，集合の圏や群の圏では一致します．

#### Thm
<div class="Thm Theorem">

群準同型 $\varphi \colon G \to H$ に対して，$\varphi$ が単射であるための必要十分条件は $\varphi$ がモノ射であることである．
$$
\varphi \colon \text{inj.} \Longleftrightarrow \varphi \colon \text{mono.}
$$
</div>

#### Proof
<div class="Proof">

$\Longrightarrow$)

$\varphi$ を単射とし，$\varphi \circ \psi_1 = \varphi \circ \psi_2$ なる任意の群準同型 $\psi_1, \psi_2 \colon H' \to H$ を取る．このとき，任意の $h' \in H'$ に対して，$\varphi (\psi_1 (h')) = \varphi (\psi_2 (h'))$ であるが，$\varphi$ は単射だから $\psi_1 (h') = \psi_2 (h')$．よって $\psi_1 = \psi_2$ となり，$\varphi$ はモノ射である．

$\Longleftarrow$)

$\varphi$ をモノ射とし，次のような群準同型 $\psi_1, \psi_2 \colon \Ker (\varphi) \to G$ を考える：
$$
\begin{align*}
\psi_1 (g) &:= g, \\
\psi_2 (g) &:= 1. \\
\end{align*}
$$
容易に分かるように $\varphi \circ \psi_1 = \varphi \circ \psi_2$ だから，$\varphi$ のモノ性より，$\psi_1 = \psi_2$．これは $\Ker (\varphi) = \{ 1 \}$ であることに他ならない．よって $\varphi$ は単射．
<span class="ProofQED"></span>
</div>

### 直積 Direct pruducts

直積の普遍性は，大雑把に言って，「ペアを作ること」です．群 $G_1, G_2$ とそれらの元 $g_1 \in G_1, g_2 \in G_2$ があったときに，ペア $(g_1, g_2) \in G_1 \times G_2$ を作ることができます．また，群準同型 $\varphi_1 \colon H \to G_1, \varphi_2 \colon H \to G_2$ があったときに，ペア $(\varphi_1, \varphi_2) \colon H \to G_1 \times G_2$ を，
$$
(\varphi_1, \varphi_2) (h) := (\varphi_1 (h), \varphi_2 (h))
$$
によって定めることができます．さらに，群準同型 $\varphi_1 \colon G_1 \to H_1$ と $\varphi_2 \colon G_2 \to H_2$ から，$(\varphi_1 \times \varphi_2) (g_1, g_2) := (\varphi_1 (g_1), \varphi_2 (g_2))$ という新たな群準同型 $\varphi_1 \times \varphi_2 \colon G_1 \times G_2 \to H_1 \times H_2$ が構成されます． このことをまとめると，

#### Thm
<div class="Thm Theorem">

群 $G_1, G_2$ に対して，次の条件を満たす群 $\Pi$ と群準同型 $\pi_1 \colon \Pi \to G_1, \pi_2 \colon \Pi \to G_2$ が同型を除いて一意に存在する：

- 任意の群 $H$ と群準同型 $\varphi_1 \colon H \to G_1, \varphi_2 \colon H \to G_2$ に対して，ただ一つの群準同型 $\varphi \colon H \to \Pi$ が存在して，$\pi_1 \circ \varphi = \varphi_1, \pi_2 \circ \varphi = \varphi_2$ とできる．
</div>

もちろん，$\Pi = G_1 \times G_2$ で，$\pi_1, \pi_2$ は標準的な射影，$\varphi = (\varphi_1, \varphi_2)$ です．

#### Cor
<div class="Thm Corollary">

$G_1, G_2, H_1, H_2$ という群と群準同型 $\varphi_1 \colon G_1 \to H_1$，$\varphi_2 \colon G_2 \to H_2$ を取る．$\pi_1 \colon G_1 \times G_2 \surj G_1, \pi_2 \colon G_1 \times G_2 \surj G_2, \pi'_1 \colon H_1 \times H_2 \surj H_1, \pi'_2 \colon H_1 \times H_2 \surj H_2$ を標準的な射影とする．このとき，ただ一つの群準同型 $\varphi \colon G_1 \times G_2 \to H_1 \times H_2$ が存在して，
$$
\begin{align*}
\varphi_1 \circ \pi_1 = \pi'_1 \circ \varphi, \\
\varphi_2 \circ \pi_2 = \pi'_2 \circ \varphi
\end{align*}
$$
となる．
</div>

#### Proof
<div class="Proof">

$\varphi = \varphi_1 \times \varphi_2 := (\varphi_1 \circ \pi_1, \varphi_2 \circ \pi_2)$ である．
<span class="ProofQED"></span>
</div>

### 直和 Direct sums

直和の普遍性は，「包含すること」です．「埋め込み」と言ってもいいです．群 $G_1$ と $G_2$ があったときに，これらを部分群として含むような最小の群が直和 $G_1 \oplus G_2$ です．$G_1$ と $G_2$ は標準的な入射によって，自然に $G_1 \oplus G_2$ の部分群とみなすことができます．さらに，群準同型 $\varphi_1 \colon G_1 \to H, \varphi_2 \colon G_2 \to H$ があれば，それらを拡張した群準同型 $\gen{\varphi_1, \varphi_2} \colon G_1 \oplus G_2 \to H$ が存在します．具体的には，
$$
\gen{\varphi_1, \varphi_2} (\dotsm g_n h_n g_{n + 1} h_{n + 1} \dotsm) = \dotsm \varphi_1 (g_n) \varphi_2 (h_n) \varphi_1 (g_{n + 1}) \varphi_2 (h_{n + 1}) \dotsm
$$
というように定義されます（$g_n \in G_1, h_n \in G_2$）．直積のときと同じように，群準同型 $\varphi_1 \colon G_1 \to H_1$ と $\varphi_2 \colon G_2 \to H_2$ を考えましょう．写像 $\varphi_1 \oplus \varphi_2 \colon G_1 \oplus G_2 \to H_1 \oplus H_2$ を，
$$
\varphi_1 \oplus \varphi_2 := \gen{\iota'_1 \circ \varphi_1, \iota'_2 \circ \varphi_2}
$$
（$\iota'_1 \colon H_1 \incl H_1 \oplus H_2, \iota_2 \colon H_2 \incl H_1 \oplus H_2$ は標準的な入射）によって定めれば，これは群準同型になります．まとめると，

#### Thm
<div class="Thm Theorem">

群 $G_1, G_2$ に対して，次の条件を満たす群 $\Sigma$ と群準同型 $\iota_1 \colon G_1 \to \Sigma, \iota_2 \colon G_2 \to \Sigma$ が同型を除いて一意に存在する：

- 任意の群 $H$ と群準同型 $\varphi_1 \colon G_1 \to H, \varphi_2 \colon G_2 \to H$ に対して，ただ一つの群準同型 $\varphi \colon \Sigma \to H$ が存在して，$\varphi \circ \iota_1 = \varphi_1, \varphi \circ \iota_2 = \varphi_2$ とできる．
</div>

この場合は $\Sigma = G_1 \oplus G_2$ で，$\iota_1, \iota_2$ は標準的な入射，$\varphi = \gen{\varphi_1, \varphi_2}$ です．

#### Cor
<div class="Thm Corollary">

$G_1, G_2, H_1, H_2$ という群と群準同型 $\varphi_1 \colon G_1 \to H_1$，$\varphi_2 \colon G_2 \to H_2$ を取る．$\iota_1 \colon G_1 \incl G_1 \oplus G_2, \iota_2 \colon G_2 \incl G_1 \oplus G_2, \iota'_1 \colon H_1 \incl H_1 \oplus H_2, \iota'_2 \colon H_2 \incl H_1 \oplus H_2$ を標準的な入射とする．このとき，ただ一つの群準同型 $\varphi \colon G_1 \oplus G_2 \to H_1 \oplus H_2$ が存在して，
$$
\begin{align*}
\varphi_\circ \iota_1 = \iota'_1 \circ \varphi_1, \\
\varphi \circ \iota_2 = \iota'_2 \circ \varphi_2
\end{align*}
$$
となる．
</div>

#### Proof
<div class="Proof">

$\varphi = \varphi_1 \oplus \varphi_2 := \gen{\iota'_1 \circ \varphi_1, \iota'_2 \circ \varphi_2}$ である．
<span class="ProofQED"></span>
</div>

### Abel 化 Abelianization
Abel 化の普遍性は，その名の通り「可換性」でしょう．群 $G$ とそのAbel 化 $\Ab G$，および標準的な全射 $\pi \colon G \surj \Ab G$ を考えます．

可換群 $H$ と群準同型 $\varphi \colon G \to H$ があれば，任意の $g_1, g_2 \in G$ に対して
$$
\varphi (g_1 g_2) = \varphi (g_1) \varphi (g_2) = \varphi (g_2) \varphi (g_1) = \varphi (g_2 g_1)
$$
が成り立つので，$[g_1, g_2] := g_1 g_2 g_1^{-1} g_2^{-1} \in \Ker (\varphi)$ となります．よって
$$
\Ker (\pi) = [G, G] \subset \Ker (\varphi)
$$
が分かります．すると，群準同型 $\widetilde\varphi \colon \Ab G \to H$ が，
$$
\widetilde\varphi (g [G, G]) := \varphi (g)
$$
によって well-defined に定まります．この $\widetilde\varphi$ は，当然 $\widetilde\varphi \circ \pi = \varphi$ を満たします．

#### Thm
<div class="Thm Theorem">

群 $G$ に対して，次の条件を満たす群 $A$ と群準同型 $\pi \colon G \to A$ とペアが同型を除いて一意に存在する：

- $A$ は可換群；
- 任意の可換群 $H$ と群準同型 $\varphi \colon G \to H$ に対して，ただ一つの群準同型 $\widetilde\varphi \colon A \to H$ が存在して，$\widetilde\varphi \circ \pi = \varphi$ とできる．
</div>

#### Cor
<div class="Thm Corollary">

群 $G, H$ と群準同型 $\varphi \colon G \to H$ を任意に取る．$\pi \colon G \surj \Ab G, \pi' \colon H \surj \Ab H$ を標準的な全射とする．このとき，ただ一つの群準同型 $\widetilde\varphi \colon \Ab G \to \Ab H$ が存在して，
$$
\widetilde\varphi \circ \pi = \pi' \circ \varphi
$$
となる．
</div>

#### Proof
<div class="Proof">

可換群 $\Ab H$ と群準同型 $\pi' \circ \varphi \colon G \to \Ab H$ に対して Abel 化の普遍性を適用すればよい．
<span class="ProofQED"></span>
</div>


### 普遍性と関手 Universalities and functors

圏論を学んでいる人なら，上の三つ（直積，直和，Abel 化）が関手であることに気づくでしょう．（実は核や余像も関手ですが，ここでは省略します．）つまり，直積と直和は
$$
\times, \oplus \colon \Grp \times \Grp \to \Grp
$$
という関手，Abel 化は
$$
\Ab \colon \Grp \to \Abl
$$
という関手になっています．ここで，$\Grp$ は群とその間の群準同型からなる圏であり，$\Abl$ は可換群とその間の群準同型からなる圏です．

さらに，Theorems によると，次のような（集合としての）全単射があります：
$$
\begin{align*}
&\Grp (H, G_1 \times G_2) \cong \Grp (H, G_1) \times \Grp (H, G_2), &\quad& \varphi \mapsto (\pi_1 \circ \varphi, \pi_2 \circ \varphi), \\
&\Grp (G_1 \oplus G_2, H) \cong \Grp (G_1, H) \times \Grp (G_2, H), &\quad& \varphi \mapsto (\varphi \circ \iota_1, \varphi \circ \iota_2), \\
&\Abl (G, A) \cong \Grp (\Ab G, A), &\quad& \varphi \mapsto \varphi \circ \pi.
\end{align*}
$$
ここで，$G, G_1, G_2, H$ は群，$A$ は可換群，$\pi, \pi_1, \pi_2, \iota_1, \iota_2$ は標準的な群準同型です．
実は，これらの全単射は**自然同型**（*natural isomorphism*）です．その意味は，上の全単射を関手間の変換（の $G_1, G_2, H, $ etc. における対応）と見たときに，これらが自然変換である，ということです．それは，Theorems の「ただ一つの」という部分を使えば示すことができます．たとえば，一番上だけ見てみましょう．

#### Thm
<div class="Thm Theorem">

$$
\Grp (H, G_1 \times G_2) \cong \Grp (H, G_1) \times \Grp (H, G_2), \quad \varphi \mapsto (\pi_1 \circ \varphi, \pi_2 \circ \varphi),
$$
という全単射は自然同型である．
</div>

#### Proof
<div class="Proof">

次のような関手 $F_1, F_2 \colon \Grp^\op \times \Grp \times \Grp \to \Set$ を考える：
$$
\begin{align*}
F_1 (H, G_1, G_2) &:= \Grp (H, G_1 \times G_2), \\
F_2 (H, G_1, G_2) &:= \Grp (H, G_1) \times \Grp (H, G_2).
\end{align*}
$$
これらは実際に関手になる．なぜなら，群準同型 $\varphi_H \colon H' \to H, \varphi_1 \colon G_1 \to G'_1, \varphi_2 \colon G_2 \to G'_2$ を取ったときに，群準同型 $F_1 (\varphi_H, \varphi_1, \varphi_2) \colon F_1 (H, G_1, G_2) \to F_1 (H', G'_1, G'_2)$ と $F_2 (\varphi_H, \varphi_1, \varphi_2) \colon F_2 (H, G_1, G_2) \to F_2 (H', G'_1, G'_2)$ が
$$
\begin{align*}
F_1 (\varphi_H, \varphi_1, \varphi_2) (\varphi) &:= (\varphi_1 \times \varphi_2) \circ \varphi \circ \varphi_H, \\
F_2 (\varphi_H, \varphi_1, \varphi_2) (\varphi, \psi) &:= (\varphi_1 \circ \varphi \circ \varphi_H) \times (\varphi_2 \circ \psi \circ \varphi_H)
\end{align*}
$$
によって定まるからである．上のように定義される変換を $\tau_{H, G_1, G_2} \colon F_1 (H, G_1, G_2) \to F_2 (H, G_1, G_2)$ とおく．$\tau \colon F_1 \to F_2$ が自然変換であること，すなわち
$$
\tau_{H', G'_1, G'_2} \circ F_1 (\varphi_H, \varphi_1, \varphi_2) = F_2 (\varphi_H, \varphi_1, \varphi_2) \circ \tau_{H, G_1, G_2}
$$
を示せばよい．これは定義に従って丁寧に計算すれば確かめられる．
<span class="ProofQED"></span>
</div>

## Further reading

- [松坂『代数系入門』（岩波）](https://www.iwanami.co.jp/book/b378349.html)
- [MacLane. Categories for the Working Mathematician. Springer.](https://www.springer.com/us/book/9780387984032)
- [阿部『ホップ代数』（岩波）](https://www.iwanami.co.jp/book/b313895.html)
- [神保『量子群とヤン・バクスター方程式』（丸善）](https://www.maruzen-publishing.co.jp/item/b294378.html)
- [Kassel. Quantum Groups](https://www.springer.com/la/book/9780387943701)

# 終わりに
