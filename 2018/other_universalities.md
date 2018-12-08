## 目次 Table of Contents

- [1. 群論の復習 Review of group theory](groups.html#群論-group-theory)
    - [1.1 基本的な概念 Basic definitions](groups.html#基本的な概念-basic-definitions)
    - [1.2 準同型定理 Isomorphism theorem](groups.html#準同型定理-isomorphism-theorem)
    - [1.3 群の構成 Construction of groups](groups.html#群の構成-construction-of-groups)
- [2. 圏論的群論 Categorical group theory](math.html#圏論的群論-categorical-group-theory)
    - [2.1 群の定義 Definition of groups](math.html#群の定義-definition-of-groups)
        - [2.1.1 積の公理 Axiom of the multiplication](math.html#積の公理-axiom-of-the-multiplication)
        - [2.1.2 単位元の公理 Axiom of the unit](math.html#単位元の公理-axiom-of-the-unit)
        - [2.1.3 逆元の公理 Axiom of the inverse elements](math.html#逆元の公理-axiom-of-the-inverse-elements)
        - [2.1.4 群の圏論的定義 Categorical definition of groups](math.html#群の圏論的定義-categorical-definition-of-groups)
    - [2.2 準同型とその核 Homomorphisms and kernels](math.html#準同型とその核-homomorphisms-and-kernels)
    - [2.3 その他の普遍性 Other universalities](#その他の普遍性-other-universalities)
        - [2.3.1 剰余群 Residue groups](#剰余群-residue-groups)
        - [2.3.2 全射と単射 Surjections and injections](#全射と単射-surjections-and-injections)
        - [2.3.3 直積 Direct pruducts](#直積-direct-pruducts)
        - [2.3.4 直和 Direct sums](#直和-direct-sums)
        - [2.3.5 Abel 化 Abelianization](#abel-化-abelianization)
        - [2.3.6 普遍性と関手 Universalities and functors](#普遍性と関手-universalities-and-functors)
- [3 Further reading](math.html#further-reading)
- [4. 終わりに](math.html#終わりに)


<h3 id="剰余群-residue-groups" style="counter-reset: section 2 subsection 3;">剰余群 Residue groups</h3>

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

<div class="Thm Theorem">

群の間の群準同型 $\varphi \colon G \to H$ が与えられたとき，次の条件を満たす群 $C$ と全射群準同型 $\pi \colon G \to C$ のペアが同型を除いて一意に存在する：

- ある群準同型 $\widetilde\varphi \colon C \to H$ が存在して，$\varphi = \widetilde\varphi \circ \pi$；
- 任意の群 $C'$ と全射群準同型 $\pi' \colon G \to C'$ のペアであって，ある群準同型 $\widetilde\varphi' \colon C' \to H$ が存在して $\varphi = \widetilde\varphi' \circ \pi'$ とできるものに対して，ただ一つの群準同型 $\widetilde{\pi'} \colon C' \to C$ が存在して，$\pi = \widetilde{\pi'} \circ \pi'$ かつ $\widetilde\varphi' = \widetilde\varphi \circ \widetilde{\pi'}$ となる．
</div>
<img src="img/cd_coimage.png" alt="img:cd_coimage.png" class="imgCD" />

### 全射と単射 Surjections and injections

次に，全射を圏論的に書き換えましょう．写像 $\varphi \colon X \to Y$ が**全射**（*surjection*）であるとは，
$$
\forall y \in Y, \ \exists x \in X, \ y = \varphi (x)
$$
となることです．一方，圏論では次のような定義があります：

<div class="Thm Definition">

写像 $\varphi \colon X \to Y$ が**エピ射**（*epimorphism*）であるとは，任意の写像 $\psi_1, \psi_2 \colon Y \to Z$ に対して，$\psi_1 \circ \varphi = \psi_2 \circ \varphi$ ならば $\psi_1 = \psi_2$ なることをいう．
$$
\forall \psi_1, \psi_2 \colon Y \to Z, \ \psi_1 \circ \varphi = \psi_2 \circ \varphi \Longrightarrow \psi_1 = \psi_2
$$
</div>
<img src="img/cd_epi.png" alt="img:cd_epi.png" class="imgCD" />

一般にこれらは一致しませんが，集合の圏等の特別な場合には一致します．群の圏もその一つです．すなわち，

<div class="Thm Proposition">

群準同型 $\varphi \colon G \to H$ に対して，$\varphi$ が全射であるための必要十分条件は $\varphi$ がエピ射であることである．
$$
\varphi \colon \text{surj.} \Longleftrightarrow \varphi \colon \text{epi.}
$$
</div>

<div class="Proof">

$\Longrightarrow$)

$\varphi$ を全射とし，$\psi_1 \circ \varphi = \psi_2 \circ \varphi$ なる任意の群準同型 $\psi_1, \psi_2 \colon H \to H'$ を取る．$\varphi$ の全射性より，$\varphi \circ \psi = \id_H$ なる写像 $\psi \colon H \to G$ が存在するから，
$$
\begin{align*}
\psi_1 &= \psi_1 \circ (\varphi \circ \psi) \\
&= (\psi_1 \circ \varphi) \circ \psi \\
&= (\psi_2 \circ \varphi) \circ \psi \\
&= \psi_2 \circ (\varphi \circ \psi) \\
&= \psi_2
\end{align*}
$$
となる．よって，$\varphi$ はエピ射．

$\Longleftarrow$)

$\varphi$ をエピ射とし，次のような群準同型 $\psi_1, \psi_2 \colon H \to H / \Im (\varphi)$ を考える：
$$
\begin{align*}
\psi_1 (h) &:= h \Im (\varphi), \\
\psi_2 (h) &:= \Im (\varphi).
\end{align*}
$$
容易に分かるように $\psi_1 \circ \varphi = \psi_2 \circ \varphi$ だから，$\varphi$ のエピ性より，$\psi_1 = \psi_2$．よって $\varphi$ は全射となる．
<span class="ProofQED"></span>
</div>

この証明に出てきた $\Coker (\varphi) := H / \Im (\varphi)$ は**余核**（*cokernel*）と呼ばれ，核と圏論的に双対的な概念です．

もちろん上の証明では，次のよく知られた事実を用いました：

<div class="Thm Lemma">
集合間の写像 $\varphi \colon X \to Y$ が全射であるための必要十分条件は，ある写像 $\psi \colon Y \to X$ が存在して，$\varphi \circ \psi = \id_Y$ とできることである．

写像 $\varphi \colon X \to Y$ が単射であるための必要十分条件は，ある写像 $\psi \colon Y \to X$ が存在して，$\psi \circ \varphi = \id_X$ とできることである．
</div>

<div class="Thm Lemma">
群準同型 $\varphi \colon G \to H$ が全射であるための必要十分条件は，余核が $\Coker (\varphi) = \{ 1 := \Im (\varphi) \}$ となることである．

群準同型 $\varphi \colon G \to H$ が単射であるための必要十分条件は，核が $\Ker (\varphi) = \{ 1 \}$ となることである．
</div>

ついでなので単射についても見てみましょう．写像 $\varphi \colon X \to Y$ が**単射**（*injection*）であるとは，
$$
\forall x_1, x_2 \in X, \ x_1 \neq x_2 \Longrightarrow \varphi (x_1) \neq \varphi (x_2)
$$
となることです．圏論では，

<div class="Thm Definition">

写像 $\varphi \colon X \to Y$ が**モノ射**（*monomorphism*）であるとは，任意の写像 $\psi_1, \psi_2 \colon Z \to X$ に対して，$\varphi \circ \psi_1 = \varphi \circ \psi_2$ ならば $\psi_1 = \psi_2$ なることをいう．
$$
\forall \psi_1, \psi_2 \colon Z \to X, \ \varphi \circ \psi_1 = \varphi \circ \psi_2 \Longrightarrow \psi_1 = \psi_2
$$
</div>
<img src="img/cd_mono.png" alt="img:cd_mono.png" class="imgCD" />

これらも一般には一致しませんが，集合の圏や群の圏では一致します．

<div class="Thm Theorem">

群準同型 $\varphi \colon G \to H$ に対して，$\varphi$ が単射であるための必要十分条件は $\varphi$ がモノ射であることである．
$$
\varphi \colon \text{inj.} \Longleftrightarrow \varphi \colon \text{mono.}
$$
</div>

<div class="Proof">

$\Longrightarrow$)

$\varphi$ を単射とし，$\varphi \circ \psi_1 = \varphi \circ \psi_2$ なる任意の群準同型 $\psi_1, \psi_2 \colon H' \to H$ を取る．$\varphi$ の単射性より，$\psi \circ \varphi = \id_G$ なる写像 $\psi \colon H \to G$ が存在するから，
$$
\begin{align*}
\psi_1 &= (\psi \circ \varphi) \circ \psi_1 \\
&= \psi \circ (\varphi \circ \psi_1) \\
&= \psi \circ (\varphi \circ \psi_2) \\
&= (\psi \circ \varphi) \circ \psi_2 \\
&= \psi_2
\end{align*}
$$
となる．よって，$\varphi$ はモノ射．

$\Longleftarrow$)

$\varphi$ をモノ射とし，次のような群準同型 $\psi_1, \psi_2 \colon \Ker (\varphi) \to G$ を考える：
$$
\begin{align*}
\psi_1 (g) &:= g, \\
\psi_2 (g) &:= 1. \\
\end{align*}
$$
容易に分かるように $\varphi \circ \psi_1 = \varphi \circ \psi_2$ だから，$\varphi$ のモノ性より，$\psi_1 = \psi_2$．よって $\varphi$ は単射．
<span class="ProofQED"></span>
</div>

### 直積 Direct pruducts

直積の普遍性は，大雑把に言って，「ペアを作ること」です．群 $G_1, G_2$ とそれらの元 $g_1 \in G_1, g_2 \in G_2$ があったときに，ペア $(g_1, g_2) \in G_1 \times G_2$ を作ることができます．また，群準同型 $\varphi_1 \colon H \to G_1, \varphi_2 \colon H \to G_2$ があったときに，ペア $(\varphi_1, \varphi_2) \colon H \to G_1 \times G_2$ を，
$$
(\varphi_1, \varphi_2) (h) := (\varphi_1 (h), \varphi_2 (h))
$$
によって定めることができます．さらに，群準同型 $\varphi_1 \colon G_1 \to H_1$ と $\varphi_2 \colon G_2 \to H_2$ から，$(\varphi_1 \times \varphi_2) (g_1, g_2) := (\varphi_1 (g_1), \varphi_2 (g_2))$ という新たな群準同型 $\varphi_1 \times \varphi_2 \colon G_1 \times G_2 \to H_1 \times H_2$ が構成されます． このことをまとめると，

<div class="Thm Theorem">

群 $G_1, G_2$ に対して，次の条件を満たす群 $\Pi$ と群準同型 $\pi_1 \colon \Pi \to G_1, \pi_2 \colon \Pi \to G_2$ が同型を除いて一意に存在する：

- 任意の群 $H$ と群準同型 $\varphi_1 \colon H \to G_1, \varphi_2 \colon H \to G_2$ に対して，ただ一つの群準同型 $\varphi \colon H \to \Pi$ が存在して，$\pi_1 \circ \varphi = \varphi_1, \pi_2 \circ \varphi = \varphi_2$ とできる．
</div>
<img src="img/cd_direct_prod.png" alt="img:cd_direct_prod.png" class="imgCD" />

もちろん，$\Pi = G_1 \times G_2$ で，$\pi_1, \pi_2$ は標準的な射影，$\varphi = (\varphi_1, \varphi_2)$ です．

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
<img src="img/cd_prod_fct.png" alt="img:cd_prod_fct.png" class="imgCD" />

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

<div class="Thm Theorem">

群 $G_1, G_2$ に対して，次の条件を満たす群 $\Sigma$ と群準同型 $\iota_1 \colon G_1 \to \Sigma, \iota_2 \colon G_2 \to \Sigma$ が同型を除いて一意に存在する：

- 任意の群 $H$ と群準同型 $\varphi_1 \colon G_1 \to H, \varphi_2 \colon G_2 \to H$ に対して，ただ一つの群準同型 $\varphi \colon \Sigma \to H$ が存在して，$\varphi \circ \iota_1 = \varphi_1, \varphi \circ \iota_2 = \varphi_2$ とできる．
</div>
<img src="img/cd_direct_sum.png" alt="img:cd_direct_sum.png" class="imgCD" />

この場合は $\Sigma = G_1 \oplus G_2$ で，$\iota_1, \iota_2$ は標準的な入射，$\varphi = \gen{\varphi_1, \varphi_2}$ です．

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
<img src="img/cd_sum_fct.png" alt="img:cd_sum_fct.png" class="imgCD" />

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

<div class="Thm Theorem">

群 $G$ に対して，次の条件を満たす群 $A$ と群準同型 $\pi \colon G \to A$ とペアが同型を除いて一意に存在する：

- $A$ は可換群；
- 任意の可換群 $H$ と群準同型 $\varphi \colon G \to H$ に対して，ただ一つの群準同型 $\widetilde\varphi \colon A \to H$ が存在して，$\widetilde\varphi \circ \pi = \varphi$ とできる．
</div>
<img src="img/cd_abel.png" alt="img:cd_abel.png" class="imgCD" />

<div class="Thm Corollary">

群 $G, H$ と群準同型 $\varphi \colon G \to H$ を任意に取る．$\pi \colon G \surj \Ab G, \pi' \colon H \surj \Ab H$ を標準的な全射とする．このとき，ただ一つの群準同型 $\widetilde\varphi \colon \Ab G \to \Ab H$ が存在して，
$$
\widetilde\varphi \circ \pi = \pi' \circ \varphi
$$
となる．
</div>
<img src="img/cd_abel_fct.png" alt="img:cd_abel_fct.png" class="imgCD" />

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

<div class="Thm Theorem">

$$
\Grp (H, G_1 \times G_2) \cong \Grp (H, G_1) \times \Grp (H, G_2), \quad \varphi \mapsto (\pi_1 \circ \varphi, \pi_2 \circ \varphi),
$$
という全単射は自然同型である．
</div>

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

[圏論のページへ戻る](math.html#further-reading)
