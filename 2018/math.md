これは，[日曜数学 Advent Calendar 2018](https://adventar.org/calendars/3009) の9日目の記事です．
昨日は ONEWAN さんの [日曜数学の歩き方](http://onewan.hatenablog.jp/entry/2018/12/08/000001)でした．

## はじめに

今年は圏論ブームが巻き起こっていたのでそれに（今更）便乗する形になります．圏論はやや抽象度の高い分野ではありますが，群論や線形代数学等の「具体的な」分野を圏論的に見直してみると，意外なほど身近に感じます．ここでは群論だけに焦点を絞って（長い文章ですが）その一端を見ていこうと思います．

## 目次 Table of Contents

- [1. 群論の復習 Review of group theory](#群論の復習-review-of-group-theory)
    - [1.1 基本的な概念 Basic definitions](groups.html#基本的な概念-basic-definitions)
    - [1.2 準同型定理 Isomorphism theorem](groups.html#準同型定理-isomorphism-theorem)
    - [1.3 群の構成 Construction of groups](groups.html#群の構成-construction-of-groups)
- [2. 圏論的群論 Categorical group theory](#圏論的群論-categorical-group-theory)
    - [2.1 群の定義 Definition of groups](#群の定義-definition-of-groups)
        - [2.1.1 積の公理 Axiom of the multiplication](#積の公理-axiom-of-the-multiplication)
        - [2.1.2 単位元の公理 Axiom of the unit](#単位元の公理-axiom-of-the-unit)
        - [2.1.3 逆元の公理 Axiom of the inverse elements](#逆元の公理-axiom-of-the-inverse-elements)
        - [2.1.4 群の圏論的定義 Categorical definition of groups](#群の圏論的定義-categorical-definition-of-groups)
    - [2.2 準同型とその核 Homomorphisms and kernels](#準同型とその核-homomorphisms-and-kernels)
    - [2.3 その他の普遍性 Other universalities](#その他の普遍性-other-universalities)
        - [2.3.1 剰余群 Residue groups](other_universalities.html#剰余群-residue-groups)
        - [2.3.2 全射と単射 Surjections and injections](other_universalities.html#全射と単射-surjections-and-injections)
        - [2.3.3 直積 Direct pruducts](other_universalities.html#直積-direct-pruducts)
        - [2.3.4 直和 Direct sums](other_universalities.html#直和-direct-sums)
        - [2.3.5 Abel 化 Abelianization](other_universalities.html#abel-化-abelianization)
        - [2.3.6 普遍性と関手 Universalities and functors](other_universalities.html#普遍性と関手-universalities-and-functors)
- [3 Further reading](#further-reading)
- [4. 終わりに](#終わりに)



# 群論の復習 Review of group theory

まず，群論の記法を思い出しましょう．本稿を理解する上で，ここに書いてあることをすべて知っている必要はないですが，十分に慣れていることを想定しています．

最初は[圏論的群論](#圏論的群論-categorical-group-theory)を読み進めて，後で知らない概念や記号が出てきたときに確認する程度でも構いません．

Mathjax の処理に時間がかかるため，[別のページ](groups.html)に用意しています．

# 圏論的群論 Categorical group theory

## 群の定義 Definition of groups

圏論では，具体的な元を用いずに，射（写像や群準同型）のみを用いて話を進めます．そこでまずは，群の定義を射のみを用いて書き換えていきましょう．

以下で可換図式がたくさん現れますが，Mathjax で使える可換図式のライブラリはやや貧弱なようです．なので LaTeX による綺麗な可換図式を併せて載せています．

### 積の公理 Axiom of the multiplication

$G$ を群としたときに，その積は，写像 $\mu \colon G \times G \to G$ であって，結合律を満たすことが要求されます．結合律は次の可換図式で表されます：
$$
\begin{CD}
G \times G \times G @>\id_G \times \mu>> G \times G \\
@V\mu \times \id_GVV @VV\mu{}V \\
G \times G @>>\mu> G
\end{CD}
$$
<img src="img/cd_ass_law.png" alt="img:cd_ass_law.png" class="imgCD" />

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
<img src="img/cd_unital_law.png" alt="img:cd_unital_law.png" class="imgCD" />

という可換図式を得ます．ここで，$\pi_1 \colon G \times \{ 1 \} \to G$ や $\pi_2 \colon \{ 1 \} \times G \to G$ は標準的な射影です．

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

<div class="Thm Definition">

群の間の写像 $\varphi \colon G \to H$ が**反群準同型**（*group anti-homomorphism*）であるとは，

- $\varphi (1) = 1$；
- 任意の $g, h \in G$ に対して $\varphi (g h) = \varphi (h) \varphi (g)$；
- 任意の $g \in G$ に対して $\varphi (g^{-1}) = \varphi (g)^{-1}$

となることをいう．
</div>

上の命題と双対的なものとして，次の命題も重要です：

<div class="Thm Proposition">

$G$ を群とすると，群準同型 $G \to \{ 1 \}$ が**ただ一つ**存在する．
</div>

この群準同型を $\varepsilon \colon G \to \{ 1 \}$ と書きましょう．もちろん $\varepsilon (g) = 1$ です．これを使えば，単位元 $1 \in G$ を，群準同型 $\eta \circ \varepsilon \colon G \to G$ によって述べることもできます．

**対角写像**（*diagonal mapping*）と呼ばれる群準同型 $\Delta \colon G \to G \times G, \ g \mapsto (g, g),$ も便利です．

$\varepsilon \colon G \to \{ 1 \}$ を**余単位**（*counit*），$\Delta \colon G \to G \times G$ を**余積**（*comultiplication*）とも呼びます．圏論的には，単位 $\eta$ や積 $\mu$ の双対にあたります．

さて，以上の写像 $S, \mu, \eta, \Delta, \varepsilon$ によって，逆元の公理 $g \cdot g^{-1} = 1 = g^{-1} \cdot g$ を可換図式で表します：
$$
\begin{CD}
G \times G @<\Delta<< G @>\Delta>> G \times G \\
@V\id_G \times SVV @VV\eta \circ \varepsilon{}V @VVS \times \id_GV \\
G \times G @>>\mu> G @<<\mu< G \times G
\end{CD}
$$
<img src="img/cd_inverse_law.png" alt="img:cd_inverse_law.png" class="imgCD" />

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
<img src="img/cd_ass_law.png" alt="img:cd_ass_law.png" class="imgCD" />

<img src="img/cd_unital_law.png" alt="img:cd_unital_law.png" class="imgCD" />

<img src="img/cd_inverse_law.png" alt="img:cd_inverse_law.png" class="imgCD" />

ここで，写像 $\Delta \colon G \to G \times G, \ g \mapsto (g, g)$ と $\varepsilon \colon G \to \{ 1 \}$ は，**一般の集合に対して**定義できる写像です．

このとき，$G$ 上の積を $g \cdot h := \mu (g, h)$ と定めれば，$G$ は $\eta (1)$ を単位元とし，$g \in G$ の逆元が $S (g)$ であるような群となることが分かります．（写像 $\eta \colon \{ 1 \} \to G$ の存在から，特に $G \neq \emptyset$ も言えます．）従って，**上の可換図式を満たすような集合 $G$ と写像 $\mu \colon G \times G \to G$，$\eta \colon \{ 1 \} \to G$，$S \colon G \to G$ のペア**のことを群と呼んでも問題なさそうです．

以上で，群を射のみによって定義することができました．

## 準同型とその核 Homomorphisms and kernels

続いて，準同型を圏論的に定式化しましょう．

<div class="Thm Proposition">

$(G, \mu_G, \eta_G, S_G)$ と $(H, \mu_H, \eta_H, S_H)$ を群とする．写像 $\varphi \colon G \to H$ が**群準同型**（*group homomorphism*）であるための必要十分条件は，

- $\varphi \circ \eta_G = \eta_H \colon \{ 1 \} \to H$；
- $\varphi \circ \mu_G = \mu_H \circ (\varphi \times \varphi) \colon G \times G \to H$；
- $\varphi \circ S_G = S_H \circ \varphi \colon G \to H$

となることである．
</div>
<img src="img/cd_group_hom.png" alt="img:cd_group_hom.png" class="imgCD" />


準同型 $\varphi \colon G \to H$ の核 $\Ker (\varphi)$ を圏論的に定式化するために，準同型の核についてもう少し詳しく考えてみましょう．今，
$$
\begin{align*}
g \in \Ker (\varphi) &\adef \varphi (g) = 1 \\
&\Longleftrightarrow \varphi (g) = \eta \circ \varepsilon (g)
\end{align*}
$$
なので，

- $\Ker (\varphi)$ は，$G$ の部分集合 $S \subset G$ であって，$\varphi |_S = \eta \circ \varepsilon |_S$ を満たすもののうち，最大のもの

と表すことができます．ここで，$|_S$ というのは，写像の $S$ への**制限**（*restriction*）を表します．これでめでたく，$\Ker (\varphi)$ の定義から元（elements）の記述を消すことができました！しかし，この「最大」というのはあまり扱いやすくありません．

$G$ の部分集合 $S, T \subset G$ について，$S \subset T$ であることと，包含写像（inclusion）$\iota \colon S \incl T$ が存在することは同値です．従って，

- $\Ker (\varphi)$ は，$\varphi |_{\Ker (\varphi)} = \eta \circ \varepsilon |_{\Ker (\varphi)}$ であり，$\varphi |_S = \eta \circ \varepsilon |_S$ なる任意の部分集合 $S \subset G$ に対して，包含写像 $S \incl \Ker (\varphi)$ が存在する

と言えます．これをもう少し進めて，次のように $\Ker (\varphi)$ を特徴づけます：

<div class="Thm Theorem">

群の間の群準同型 $\varphi \colon G \to H$ が与えられたとき，次の条件を満たす群 $K$ と群準同型 $\iota \colon K \to G$ のペアが同型を除いて**一意に**存在する：

- $\varphi \circ \iota = \eta_H \circ \varepsilon_K$；
- $\varphi \circ \iota' = \eta_H \circ \varepsilon_{K'}$ なる任意の群 $K'$ と群準同型 $\iota' \colon K' \to G$ のペアに対して，ただ一つの群準同型 $\widetilde{\iota'} \colon K' \to K$ が存在して $\iota' = \iota \circ \widetilde{\iota'}$ とできる．
</div>
<img src="img/cd_kernel.png" alt="img:cd_kernel.png" class="imgCD" />


核 $\Ker (\varphi)$ と包含写像 $\iota \colon \Ker (\varphi) \incl G$ のペアは，この定理の $(K, \iota)$ の条件を満たすので，これにより**核を（同型を除いて）決定することができます**．そこで，この定理を**核の普遍性**（*universal property of kernels*）といいます．

具体的な元を一切使わずに，射のみによって核を定義することは，非常に素晴らしいことです！核があれば，正規部分群も定義できます．（$\Ker (\varphi)$ は $G$ の正規部分群であり，正規部分群はある準同型の核になっている．）そうすると剰余群もまた定義することができます．余裕のある人は確かめてほしいのですが，群論だけでなく，環やベクトル空間，位相空間等でもまったく同じ話が成り立ちます．そこでは，正規部分群と（両側）イデアル，線形部分空間が同じ役割を担っていることを見るでしょう．圏論による抽象化の威力の一旦を垣間見ます．

さて，最初なので普遍性を証明してみましょう．この手の主張の証明は，ほとんどの場合，「（少なくとも一つ）存在すること」と「（存在すれば）高々一つであること」の二つを独立に示します．

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

<img src="img/cd_uniqueness.png" alt="img:cd_uniqueness.png" class="imgCD" />

<span class="ProofQED"></span>
</div>

## その他の普遍性 Other universalities

MathJax の処理による負担を軽減するため，[こちら](other_universalities.html)に書いています．


# Further reading

- [阿部『ホップ代数』（岩波）](https://www.iwanami.co.jp/book/b313895.html)
- [Kassel. Quantum Groups. Springer.](https://www.springer.com/la/book/9780387943701)
- [神保『量子群とヤン・バクスター方程式』（丸善）](https://www.maruzen-publishing.co.jp/item/b294378.html)
- [MacLane. Categories for the Working Mathematician. Springer.](https://www.springer.com/us/book/9780387984032) 邦訳（三好，高木訳）：[マックレーン『圏論の基礎』（丸善）](https://www.maruzen-publishing.co.jp/item/b294317.html)
- [松坂『代数系入門』（岩波）](https://www.iwanami.co.jp/book/b378349.html)

# 終わりに

できるだけ群論の基礎に絞ったつもりですが，self-contained になるように努めたのでかなり長くなってしまいました．それにもかかわらず，自分の感じた圏論の魅力はその一端しか伝えることができなかったと思います．やはり他の分野の色々な概念を圏論的に定式化して初めてその強力さを知るのでしょう．

いずれにせよ，群論でさえもこれほどまでに多くの圏論的事項が現れるのは，個人的にすごく感動したことです．その氷山の一角をぜひ理解してほしいです．

明日は puit5781 さんです．


長い記事ですが，ここまでありがとうございました．

