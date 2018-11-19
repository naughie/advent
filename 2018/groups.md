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

# 群論

## 基本的な概念

#### Def

<div class="Thm Definition">

集合 $G$ が**群**（*group*）であるとは，$G$ 上に**積**（*multiplication*）と呼ばれる結合的な二項演算があり，**単位元**（*identity element*）が存在し，各 $g \in G$ に対してその**逆元**（*inverse*）が定まっていることをいう．

群 $G$ が積について可環なとき，すなわち任意の $g, h \in G$ に対して $g h = h g$ なるとき，$G$ を**可換群**（*commutative group*），あるいは**Abel 群**（*Abelian group*）という．
</div>

容易に分かるように，群における単位元と逆元は一意です．そこで，特に断らない限りは，単位元を常に $1 \in G$ と表すことにします．$g \in G$ の逆元は $g^{-1} \in G$ と表します．
単位元の存在から，特に $G \neq \emptyset$ も言えます．

#### Def
<div class="Thm Definition">

群 $G$ の部分集合 $H \subset G$ が $G$ の**部分群**（*subgroup*）であるとは，$H$ が $G$ と同じ演算に関して群となること，すなわち任意の $g, h \in H$ に対して
$$
  g h, \ g^{-1} \in H
$$
となることをいう．このとき，$H \le G$ と書く．

$G$ の部分群 $H$ が**正規**（*normal*）であるとは，$H$ が $G$ の共役で不変であること，すなわち任意の $g \in G$ と $h \in H$ に対して
$$
  g h g^{-1} \in H
$$
となることをいう．このとき，$H \vartriangleleft G$ と書く．
</div>

$G$ が可換群ならば，$G$ のすべての部分群は正規です．非可換群においては，部分群が正規であるとは限りません．

#### Def
<div class="Thm Definition">

群の間の写像 $\varphi \colon G \to H$ が**群準同型**（*group homomorphism*）であるとは，$\varphi$ が $G$ の群構造を保存すること，すなわち

- $\varphi (1) = 1$；
- 任意の $g, h \in G$ に対して $\varphi (g h) = \varphi (g) \varphi (h)$；
- 任意の $g \in G$ に対して $\varphi (g^{-1}) = \varphi (g)^{-1}$

となることをいう．

群準同型 $\varphi \colon G \to H$ が**群同型**（*group isomorphism*）であるとは，群準同型 $\psi \colon H \to G$ が存在して，
$$
  \psi \circ \varphi = \id_G, \quad \varphi \circ \psi = \id_H
$$
となることをいう．群同型 $G \to H$ が存在するとき（従って群同型 $H \to G$ も存在するとき），$G$ と $H$ は互いに**群同型**（*group-isomorphic*）であるといい，$G \cong H$ と書く．
</div>

群準同型，群同型（group isomorphism, group-isomorphic）を単に準同型（homomorphism），同型（isomorphism, isomorphic）とも言います．

#### Def
<div class="Thm Definition">

群 $G$ とその正規部分群 $H \vartriangleleft G$ があるとき，$G$ 上の同値関係
$$
  g \sim h \adef g^{-1} h \in H
$$
で割った商集合 $G /\! \sim$ は自然に群となり，
$$
  G /\! \sim {}= \{ g H \mid g \in G \}, \quad g H := \{ g h \mid h \in H \}
$$
という形をしている．この $G /\! \sim$ を $G / H := G /\! \sim$ と書き，$G$ の $H$ による**剰余群**（*residue group*）という．

このとき，写像 $\pi \colon G \to G / H, \ g \mapsto g H,$ は全射群準同型となる．この $\pi$ を**標準的な全射**（*canonical surjection*）といい，$\pi \colon G \surj G / H$ と書く．
</div>

「標準的」は，「自然な（natural）」とも言われます．つまり，「$G$ から $G / H$ への写像（群準同型）を作ろうと思ったときに，最も自然に考えられるもの」というキモチです．これは，後で見る圏論的な考えにも関係してきます．

## 準同型定理

#### Def
<div class="Thm Definition">

群準同型 $\varphi \colon G \to H$ に対して，$G$ の部分集合
$$
\Ker (\varphi) := \{ g \in G \mid \varphi (g) = 1 \} = \varphi^{-1} (1)
$$
を $\varphi$ の**核**（*kernel*）といい，$H$ の部分集合
$$
\Im (\varphi) := \{ \varphi (g) \mid g \in G \} = \varphi (G)
$$
を $\varphi$ の**像**（*image*）という．
</div>

#### Prop
<div class="Thm Proposition">

$\varphi \colon G \to H$ を群準同型とする．このとき，
$$
\Ker (\varphi) \vartriangleleft G, \quad \Im (\varphi) \le H.
$$
</div>

#### Thm
<div class="Thm Theorem">

群準同型 $\varphi \colon G \to H$ を考える．上の命題より，$\Ker (\varphi)$ は $G$ の正規部分群だから，その剰余群 $G / \Ker (\varphi)$ を構成することができる．このとき，
$$
G / \Ker (\varphi) \cong \Im (\varphi).
$$
</div>

この定理を**準同型定理**（*isomorphism theorem*）と言います．（正確には**第一**準同型定理ですが．）

## 群の構成

ここで考えるのは，群が一つ，または複数与えられたときに，新たな群を構成することです．

まず，群 $G, H$ があるとき，その直積**集合** $G \times H$ が作れます．$G \times H$ 上には，次のような群構造を入れるのが自然でしょう：
$$
(g_1, h_1) \cdot (g_2, h_2) := (g_1 g_2, h_1 h_2) \quad (g_1, g_2 \in G, \ h_1, h_2 \in H).
$$

このとき，単位元は $(1, 1) \in G \times H$，$(g, h) \in G \times H$ の逆元は $(g^{-1}, h^{-1}) \in G \times H$ です．

#### Def
<div class="Thm Definition">

上のように構成された群 $G \times H$ を，$G$ と $H$ の**直積群**（*direct product group*）と呼ぶ．

以下のように定まる写像

- $\pi_1 \colon G \times H \to G, \ (g, h) \mapsto g$；
- $\pi_2 \colon G \times H \to H, \ (g, h) \mapsto h$

は全射群準同型である．これらを**標準的な射影**（*canonical projections*）といい，$\pi_1 \colon G \times H \surj G$ や $\pi_2 \colon G \times H \surj H$ と書く．
</div>

$G$ は $G \times H$ の正規部分群 $G' := \{ (g, 1) \in G \times H \mid g \in G \}$ と群同型になります．そこで，$G$ と $G'$ を**同一視**してみます．$H$ も同様に，$H' := \{ (1, h) \in G \times H \mid h \in H \}$ と同一視します．すると，標準的な射影 $\pi_1 \colon G \times H \surj G'$ は，標準的な全射 $\pi \colon G \times H \surj (G \times H) / H'$ に他ならないことが分かります．

#### Lem
<div class="Thm Lemma">

$G$ を群とし，$S \subset G$ をその（空でも構わない）部分集合とする．このとき，$S$ を含むような $G$ の最小の部分群 $\gen{S}_G \le G$ が存在する．すなわち，$G$ の部分群 $\gen{S}_G$ であって，$S \subset \gen{S}_G$ かつ，$S \subset H \le G$ なる任意の部分群 $H$ に対して $\gen{S}_G \subset H$ となるようなものが存在する．
</div>

#### Proof
<div class="Proof">

$$
\mathcal{S} := \{ H \le G \mid S \subset H \}
$$
とおいて，$\mathcal{S}$ に Zorn の補題を適用すれば，**極小**元 $H \in \mathcal{S}$ が存在することが分かる．これが**最小**元であることを示すために，$H' \in \mathcal{S}$ を任意に取る．もし $H \not\subset H'$ であれば，$H \cap H' \subsetneq H$ である．一方，$H, H' \in \mathcal{S}$ より，$H \cap H' \in \mathcal{S}$ である（実際，$H$ と $H'$ はともに部分群であるから $H \cap H' \le G$．また，$S \subset H, H'$ より，$S \subset H \cap H'$．よって $H \cap H' \in \mathcal{S}$．）が，これは $H$ の極小性に矛盾．よって $H \subset H'$ であるから，$H$ は $\mathcal{S}$ の最小元であることが言えた．
<span class="ProofQED"></span>
</div>

#### Def
<div class="Thm Definition">

上の補題によって存在が保証された部分群 $\gen{S}_G$ を**$S$ によって生成された部分群**（*subgroup generated by $S$*）という．
</div>

$S = \emptyset$ のときは，$\gen{S}_G = \{ 1 \}$ です．そうでないときは，
$$
\gen{S}_G = \{ s_1 s_2 \dotsm s_n \mid n \in \mathbb{Z}_{\gt 0}, \  s_i \in S \ \text{or} \ s_i^{-1} \in S \ (1 \le i \le n) \} \cup \{ 1 \}
$$
という形をしています．

次に，自由群と群の直和について見てみましょう．

#### Def
<div class="Thm Definition">

集合 $S$ に対して，$S$ 上の**語**（*words*）全体からなる集合
$$
\gen{S} = \{ s_1 s_2 \dotsm s_n \mid n \in \mathbb{Z}_{\gt 0}, \  s_i \in S \ \text{or} \ s_i^{-1} \in S \ (1 \le i \le n) \} \cup \{ 1 \}
$$
を **$S$ によって生成された自由群**（*free group generated by $S$*），あるいは **$S$ を基底とする自由群**（*free group with basis $S$*）という．
</div>

#### Def
<div class="Thm Definition">

群 $G$ と $H$ の**直和**（*direct sum*）とは，
$$
G \oplus H := \{ x_1 x_2 \dotsm x_n \mid n \in \mathbb{Z}_{\gt 0}, \ x_i \in G \ \text{or} \ x_i \in H \ (1 \le i \le n) \} \cup \{ 1 \}
$$
という群のことである．

以下のように定まる写像

- $\iota_1 \colon G \to G \oplus H, \ g \mapsto g$；
- $\iota_2 \colon H \to G \oplus H, \ h \mapsto h$

は単射群準同型である．これらを**標準的な入射**（*canonical injections*）といい，$\iota_1 \colon G \incl G \oplus H$ や $\iota_2 \colon H \incl G \oplus H$ と書く．
</div>

最後に，交換子群と可換化について復習します．

#### Def
<div class="Thm Definition">

群 $G$ の元 $g, h \in G$ に対して
$$
[g, h] := g h g^{-1} h^{-1}
$$
とおき，$g$ と $h$ の**交換子**（*commutator*）という．

$G$ の空でない部分集合 $S, T \subset G$ に対して
$$
[S, T] := \gen{\{ [s, t] \mid s \in S, t \in T \}}_G
$$
とおくと，特に $[G, G]$ は $G$ の正規部分群となる．この $[G, G] \vartriangleleft G$ を $G$ の**交換子群**（*commutator group*）といい，その剰余群 $\Ab G := G / [G, G]$ を $G$ の**Abel 化**（*Abelianization*）という．
</div>

その名前から想像できるように，$\Ab G$ は可換群になります．さらに，$G$ が可換群のときは $[G, G] = \{ 1 \}$ なので，$G \cong \Ab G$ となります．大雑把に言えば，$[G, G]$ は $G$ の「非可換度合」を測ったもので，$G / [G, G]$ はその「非可換な部分」をすべて潰したもの，というイメージです．

以上で群論からの準備は終わりです．いよいよ圏論を考えていきましょう．
