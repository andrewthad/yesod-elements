{-# language OverloadedStrings #-}

{-# OPTIONS_GHC -Wall #-}

module Yesod.Elements
  (
  -- * Parent Elements
    a_
  , abbr_
  , address_
  , article_
  , aside_
  , audio_
  , b_
  , bdo_
  , blockquote_
  , body_
  , button_
  , canvas_
  , caption_
  , cite_
  , code_
  , colgroup_
  , command_
  , datalist_
  , dd_
  , del_
  , details_
  , dfn_
  , div_
  , dl_
  , dt_
  , em_
  , fieldset_
  , figcaption_
  , figure_
  , footer_
  , form_
  , h1_
  , h2_
  , h3_
  , h4_
  , h5_
  , h6_
  , head_
  , header_
  , hgroup_
  , html_
  , i_
  , iframe_
  , ins_
  , kbd_
  , label_
  , legend_
  , li_
  , main_
  , map_
  , mark_
  , menu_
  , meter_
  , nav_
  , noscript_
  , object_
  , ol_
  , optgroup_
  , option_
  , output_
  , p_
  , pre_
  , progress_
  , q_
  , rp_
  , rt_
  , ruby_
  , samp_
  , script_
  , section_
  , select_
  , small_
  , span_'
  , strong_
  , style_
  , sub_
  , summary_
  , sup_
  , table_
  , tbody_
  , td_
  , textarea_
  , tfoot_
  , th_
  , thead_
  , time_
  , title_
  , tr_
  , ul_
  , var_
  , video_
  -- * Leaf Elements
  , area_
  , base_
  , br_
  , col_
  , embed_
  , hr_
  , img_
  , input_
  , keygen_
  , link_
  , menuitem_
  , meta_
  , param_
  , source_
  , track_
  , wbr_
  -- * Attributes
  , accept_
  , acceptCharset_
  , accesskey_
  , action_
  , alt_
  , async_
  , autocomplete_
  , autofocus_
  , autoplay_
  , challenge_
  , charset_
  , checked_
  , cite_'
  , class_
  , cols_
  , colspan_
  , content_
  , contenteditable_
  , contextmenu_
  , controls_
  , coords_
  , data_
  , datetime_
  , defer_
  , dir_
  , disabled_
  , draggable_
  , enctype_
  , for_'
  , form_'
  , formaction_
  , formenctype_
  , formmethod_
  , formnovalidate_
  , formtarget_
  , headers_
  , height_
  , hidden_
  , high_
  , href_
  , hreflang_
  , httpEquiv_
  , icon_
  , id_
  , ismap_
  , item_
  , itemprop_
  , itemscope_
  , itemtype_
  , keytype_
  , label_'
  , lang_
  , list_
  , loop_
  , low_
  , manifest_
  , max_
  , maxlength_
  , media_
  , method_
  , min_
  , multiple_
  , name_
  , novalidate_
  , onbeforeonload_
  , onbeforeprint_
  , onblur_
  , oncanplay_
  , oncanplaythrough_
  , onchange_
  , oncontextmenu_
  , onclick_
  , ondblclick_
  , ondrag_
  , ondragend_
  , ondragenter_
  , ondragleave_
  , ondragover_
  , ondragstart_
  , ondrop_
  , ondurationchange_
  , onemptied_
  , onended_
  , onerror_
  , onfocus_
  , onformchange_
  , onforminput_
  , onhaschange_
  , oninput_
  , oninvalid_
  , onkeydown_
  , onkeyup_
  , onload_
  , onloadeddata_
  , onloadedmetadata_
  , onloadstart_
  , onmessage_
  , onmousedown_
  , onmousemove_
  , onmouseout_
  , onmouseover_
  , onmouseup_
  , onmousewheel_
  , ononline_
  , onpagehide_
  , onpageshow_
  , onpause_
  , onplay_
  , onplaying_
  , onprogress_
  , onpropstate_
  , onratechange_
  , onreadystatechange_
  , onredo_
  , onresize_
  , onscroll_
  , onseeked_
  , onseeking_
  , onselect_
  , onstalled_
  , onstorage_
  , onsubmit_
  , onsuspend_
  , ontimeupdate_
  , onundo_
  , onunload_
  , onvolumechange_
  , onwaiting_
  , open_
  , optimum_
  , pattern_
  , ping_
  , placeholder_
  , preload_
  , pubdate_
  , radiogroup_
  , readonly_
  , rel_
  , required_
  , reversed_
  , role_
  , rows_
  , rowspan_
  , sandbox_
  , scope_
  , scoped_
  , seamless_
  , selected_
  , shape_
  , size_
  , sizes_
  , span_
  , spellcheck_
  , src_
  , srcdoc_
  , start_
  , step_
  , style_'
  , subject_
  , summary_'
  , tabindex_
  , target_
  , title_'
  , type_
  , usemap_
  , value_
  , width_
  , wrap_
  , xmlns_
    -- * Lift HTML to Widget
  , liftParent
  , liftLeaf
  ) where

import Yesod.Core (toWidget)
import Yesod.Core.Types (WidgetFor(..))
import Text.Blaze.Html (Html,Attribute,AttributeValue)
import Data.Foldable
import Data.String (fromString)
import Data.Monoid
import qualified Text.Blaze.Renderer.Utf8 as BLZU
import qualified Text.Blaze.Renderer.Text as BLZT
import qualified Text.Blaze.Renderer.String as BLZS
import qualified Data.ByteString.Lazy as LB
import qualified Data.ByteString.Builder as BB
import qualified Data.Text.Lazy.Builder as TB
import qualified Data.Text.Lazy as LT
import qualified Text.Blaze.Internal as BI
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as HA

a_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
a_ = liftParent "<a" "</a>"

abbr_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
abbr_ = liftParent "<abbr" "</abbr>"

address_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
address_ = liftParent "<address" "</address>"

article_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
article_ = liftParent "<article" "</article>"

aside_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
aside_ = liftParent "<aside" "</aside>"

audio_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
audio_ = liftParent "<audio" "</audio>"

b_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
b_ = liftParent "<b" "</b>"

bdo_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
bdo_ = liftParent "<bdo" "</bdo>"

blockquote_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
blockquote_ = liftParent "<blockquote" "</blockquote>"

body_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
body_ = liftParent "<body" "</body>"

button_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
button_ = liftParent "<button" "</button>"

canvas_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
canvas_ = liftParent "<canvas" "</canvas>"

caption_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
caption_ = liftParent "<caption" "</caption>"

cite_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
cite_ = liftParent "<cite" "</cite>"

code_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
code_ = liftParent "<code" "</code>"

colgroup_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
colgroup_ = liftParent "<colgroup" "</colgroup>"

command_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
command_ = liftParent "<command" "</command>"

datalist_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
datalist_ = liftParent "<datalist" "</datalist>"

dd_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
dd_ = liftParent "<dd" "</dd>"

del_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
del_ = liftParent "<del" "</del>"

details_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
details_ = liftParent "<details" "</details>"

dfn_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
dfn_ = liftParent "<dfn" "</dfn>"

div_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
div_ = liftParent "<div" "</div>"

dl_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
dl_ = liftParent "<dl" "</dl>"

dt_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
dt_ = liftParent "<dt" "</dt>"

em_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
em_ = liftParent "<em" "</em>"

fieldset_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
fieldset_ = liftParent "<fieldset" "</fieldset>"

figcaption_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
figcaption_ = liftParent "<figcaption" "</figcaption>"

figure_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
figure_ = liftParent "<figure" "</figure>"

footer_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
footer_ = liftParent "<footer" "</footer>"

form_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
form_ = liftParent "<form" "</form>"

h1_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h1_ = liftParent "<h1" "</h1>"

h2_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h2_ = liftParent "<h2" "</h2>"

h3_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h3_ = liftParent "<h3" "</h3>"

h4_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h4_ = liftParent "<h4" "</h4>"

h5_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h5_ = liftParent "<h5" "</h5>"

h6_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
h6_ = liftParent "<h6" "</h6>"

head_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
head_ = liftParent "<head" "</head>"

header_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
header_ = liftParent "<header" "</header>"

hgroup_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
hgroup_ = liftParent "<hgroup" "</hgroup>"

html_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
html_ = liftParent "<html" "</html>"

i_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
i_ = liftParent "<i" "</i>"

iframe_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
iframe_ = liftParent "<iframe" "</iframe>"

ins_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
ins_ = liftParent "<ins" "</ins>"

kbd_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
kbd_ = liftParent "<kbd" "</kbd>"

label_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
label_ = liftParent "<label" "</label>"

legend_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
legend_ = liftParent "<legend" "</legend>"

li_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
li_ = liftParent "<li" "</li>"

main_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
main_ = liftParent "<main" "</main>"

map_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
map_ = liftParent "<map" "</map>"

mark_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
mark_ = liftParent "<mark" "</mark>"

menu_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
menu_ = liftParent "<menu" "</menu>"

meter_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
meter_ = liftParent "<meter" "</meter>"

nav_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
nav_ = liftParent "<nav" "</nav>"

noscript_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
noscript_ = liftParent "<noscript" "</noscript>"

object_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
object_ = liftParent "<object" "</object>"

ol_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
ol_ = liftParent "<ol" "</ol>"

optgroup_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
optgroup_ = liftParent "<optgroup" "</optgroup>"

option_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
option_ = liftParent "<option" "</option>"

output_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
output_ = liftParent "<output" "</output>"

p_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
p_ = liftParent "<p" "</p>"

pre_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
pre_ = liftParent "<pre" "</pre>"

progress_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
progress_ = liftParent "<progress" "</progress>"

q_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
q_ = liftParent "<q" "</q>"

rp_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
rp_ = liftParent "<rp" "</rp>"

rt_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
rt_ = liftParent "<rt" "</rt>"

ruby_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
ruby_ = liftParent "<ruby" "</ruby>"

samp_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
samp_ = liftParent "<samp" "</samp>"

script_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
script_ = liftParent "<script" "</script>"

section_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
section_ = liftParent "<section" "</section>"

select_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
select_ = liftParent "<select" "</select>"

small_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
small_ = liftParent "<small" "</small>"

span_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
span_ = liftParent "<span" "</span>"

strong_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
strong_ = liftParent "<strong" "</strong>"

style_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
style_ = liftParent "<style" "</style>"

sub_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
sub_ = liftParent "<sub" "</sub>"

summary_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
summary_ = liftParent "<summary" "</summary>"

sup_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
sup_ = liftParent "<sup" "</sup>"

table_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
table_ = liftParent "<table" "</table>"

tbody_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
tbody_ = liftParent "<tbody" "</tbody>"

td_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
td_ = liftParent "<td" "</td>"

textarea_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
textarea_ = liftParent "<textarea" "</textarea>"

tfoot_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
tfoot_ = liftParent "<tfoot" "</tfoot>"

th_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
th_ = liftParent "<th" "</th>"

thead_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
thead_ = liftParent "<thead" "</thead>"

time_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
time_ = liftParent "<time" "</time>"

title_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
title_ = liftParent "<title" "</title>"

tr_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
tr_ = liftParent "<tr" "</tr>"

ul_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
ul_ = liftParent "<ul" "</ul>"

var_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
var_ = liftParent "<var" "</var>"

video_ :: Foldable t => t Attribute -> WidgetFor site a -> WidgetFor site a
video_ = liftParent "<video" "</video>"



area_ :: Foldable t => t Attribute -> WidgetFor site ()
area_ = liftLeaf H.area

base_ :: Foldable t => t Attribute -> WidgetFor site ()
base_ = liftLeaf H.base

br_ :: Foldable t => t Attribute -> WidgetFor site ()
br_ = liftLeaf H.br

col_ :: Foldable t => t Attribute -> WidgetFor site ()
col_ = liftLeaf H.col

embed_ :: Foldable t => t Attribute -> WidgetFor site ()
embed_ = liftLeaf H.embed

hr_ :: Foldable t => t Attribute -> WidgetFor site ()
hr_ = liftLeaf H.hr

img_ :: Foldable t => t Attribute -> WidgetFor site ()
img_ = liftLeaf H.img

input_ :: Foldable t => t Attribute -> WidgetFor site ()
input_ = liftLeaf H.input

keygen_ :: Foldable t => t Attribute -> WidgetFor site ()
keygen_ = liftLeaf H.keygen

link_ :: Foldable t => t Attribute -> WidgetFor site ()
link_ = liftLeaf H.link

menuitem_ :: Foldable t => t Attribute -> WidgetFor site ()
menuitem_ = liftLeaf H.menuitem

meta_ :: Foldable t => t Attribute -> WidgetFor site ()
meta_ = liftLeaf H.meta

param_ :: Foldable t => t Attribute -> WidgetFor site ()
param_ = liftLeaf H.param

source_ :: Foldable t => t Attribute -> WidgetFor site ()
source_ = liftLeaf H.source

track_ :: Foldable t => t Attribute -> WidgetFor site ()
track_ = liftLeaf H.track

wbr_ :: Foldable t => t Attribute -> WidgetFor site ()
wbr_ = liftLeaf H.wbr

accept_ :: AttributeValue -> Attribute
accept_ = HA.accept

acceptCharset_ :: AttributeValue -> Attribute
acceptCharset_ = HA.acceptCharset

accesskey_ :: AttributeValue -> Attribute
accesskey_ = HA.accesskey

action_ :: AttributeValue -> Attribute
action_ = HA.action

alt_ :: AttributeValue -> Attribute
alt_ = HA.alt

async_ :: AttributeValue -> Attribute
async_ = HA.async

autocomplete_ :: AttributeValue -> Attribute
autocomplete_ = HA.autocomplete

autofocus_ :: AttributeValue -> Attribute
autofocus_ = HA.autofocus

autoplay_ :: AttributeValue -> Attribute
autoplay_ = HA.autoplay

challenge_ :: AttributeValue -> Attribute
challenge_ = HA.challenge

charset_ :: AttributeValue -> Attribute
charset_ = HA.charset

checked_ :: AttributeValue -> Attribute
checked_ = HA.checked

cite_' :: AttributeValue -> Attribute
cite_' = HA.cite

class_ :: AttributeValue -> Attribute
class_ = HA.class_

cols_ :: AttributeValue -> Attribute
cols_ = HA.cols

colspan_ :: AttributeValue -> Attribute
colspan_ = HA.colspan

content_ :: AttributeValue -> Attribute
content_ = HA.content

contenteditable_ :: AttributeValue -> Attribute
contenteditable_ = HA.contenteditable

contextmenu_ :: AttributeValue -> Attribute
contextmenu_ = HA.contextmenu

controls_ :: AttributeValue -> Attribute
controls_ = HA.controls

coords_ :: AttributeValue -> Attribute
coords_ = HA.coords

data_ :: AttributeValue -> Attribute
data_ = HA.data_

datetime_ :: AttributeValue -> Attribute
datetime_ = HA.datetime

defer_ :: AttributeValue -> Attribute
defer_ = HA.defer

dir_ :: AttributeValue -> Attribute
dir_ = HA.dir

disabled_ :: AttributeValue -> Attribute
disabled_ = HA.disabled

draggable_ :: AttributeValue -> Attribute
draggable_ = HA.draggable

enctype_ :: AttributeValue -> Attribute
enctype_ = HA.enctype

for_' :: AttributeValue -> Attribute
for_' = HA.for

form_' :: AttributeValue -> Attribute
form_' = HA.form

formaction_ :: AttributeValue -> Attribute
formaction_ = HA.formaction

formenctype_ :: AttributeValue -> Attribute
formenctype_ = HA.formenctype

formmethod_ :: AttributeValue -> Attribute
formmethod_ = HA.formmethod

formnovalidate_ :: AttributeValue -> Attribute
formnovalidate_ = HA.formnovalidate

formtarget_ :: AttributeValue -> Attribute
formtarget_ = HA.formtarget

headers_ :: AttributeValue -> Attribute
headers_ = HA.headers

height_ :: AttributeValue -> Attribute
height_ = HA.height

hidden_ :: AttributeValue -> Attribute
hidden_ = HA.hidden

high_ :: AttributeValue -> Attribute
high_ = HA.high

href_ :: AttributeValue -> Attribute
href_ = HA.href

hreflang_ :: AttributeValue -> Attribute
hreflang_ = HA.hreflang

httpEquiv_ :: AttributeValue -> Attribute
httpEquiv_ = HA.httpEquiv

icon_ :: AttributeValue -> Attribute
icon_ = HA.icon

id_ :: AttributeValue -> Attribute
id_ = HA.id

ismap_ :: AttributeValue -> Attribute
ismap_ = HA.ismap

item_ :: AttributeValue -> Attribute
item_ = HA.item

itemprop_ :: AttributeValue -> Attribute
itemprop_ = HA.itemprop

itemscope_ :: AttributeValue -> Attribute
itemscope_ = HA.itemscope

itemtype_ :: AttributeValue -> Attribute
itemtype_ = HA.itemtype

keytype_ :: AttributeValue -> Attribute
keytype_ = HA.keytype

label_' :: AttributeValue -> Attribute
label_' = HA.label

lang_ :: AttributeValue -> Attribute
lang_ = HA.lang

list_ :: AttributeValue -> Attribute
list_ = HA.list

loop_ :: AttributeValue -> Attribute
loop_ = HA.loop

low_ :: AttributeValue -> Attribute
low_ = HA.low

manifest_ :: AttributeValue -> Attribute
manifest_ = HA.manifest

max_ :: AttributeValue -> Attribute
max_ = HA.max

maxlength_ :: AttributeValue -> Attribute
maxlength_ = HA.maxlength

media_ :: AttributeValue -> Attribute
media_ = HA.media

method_ :: AttributeValue -> Attribute
method_ = HA.method

min_ :: AttributeValue -> Attribute
min_ = HA.min

multiple_ :: AttributeValue -> Attribute
multiple_ = HA.multiple

name_ :: AttributeValue -> Attribute
name_ = HA.name

novalidate_ :: AttributeValue -> Attribute
novalidate_ = HA.novalidate

onbeforeonload_ :: AttributeValue -> Attribute
onbeforeonload_ = HA.onbeforeonload

onbeforeprint_ :: AttributeValue -> Attribute
onbeforeprint_ = HA.onbeforeprint

onblur_ :: AttributeValue -> Attribute
onblur_ = HA.onblur

oncanplay_ :: AttributeValue -> Attribute
oncanplay_ = HA.oncanplay

oncanplaythrough_ :: AttributeValue -> Attribute
oncanplaythrough_ = HA.oncanplaythrough

onchange_ :: AttributeValue -> Attribute
onchange_ = HA.onchange

oncontextmenu_ :: AttributeValue -> Attribute
oncontextmenu_ = HA.oncontextmenu

onclick_ :: AttributeValue -> Attribute
onclick_ = HA.onclick

ondblclick_ :: AttributeValue -> Attribute
ondblclick_ = HA.ondblclick

ondrag_ :: AttributeValue -> Attribute
ondrag_ = HA.ondrag

ondragend_ :: AttributeValue -> Attribute
ondragend_ = HA.ondragend

ondragenter_ :: AttributeValue -> Attribute
ondragenter_ = HA.ondragenter

ondragleave_ :: AttributeValue -> Attribute
ondragleave_ = HA.ondragleave

ondragover_ :: AttributeValue -> Attribute
ondragover_ = HA.ondragover

ondragstart_ :: AttributeValue -> Attribute
ondragstart_ = HA.ondragstart

ondrop_ :: AttributeValue -> Attribute
ondrop_ = HA.ondrop

ondurationchange_ :: AttributeValue -> Attribute
ondurationchange_ = HA.ondurationchange

onemptied_ :: AttributeValue -> Attribute
onemptied_ = HA.onemptied

onended_ :: AttributeValue -> Attribute
onended_ = HA.onended

onerror_ :: AttributeValue -> Attribute
onerror_ = HA.onerror

onfocus_ :: AttributeValue -> Attribute
onfocus_ = HA.onfocus

onformchange_ :: AttributeValue -> Attribute
onformchange_ = HA.onformchange

onforminput_ :: AttributeValue -> Attribute
onforminput_ = HA.onforminput

onhaschange_ :: AttributeValue -> Attribute
onhaschange_ = HA.onhaschange

oninput_ :: AttributeValue -> Attribute
oninput_ = HA.oninput

oninvalid_ :: AttributeValue -> Attribute
oninvalid_ = HA.oninvalid

onkeydown_ :: AttributeValue -> Attribute
onkeydown_ = HA.onkeydown

onkeyup_ :: AttributeValue -> Attribute
onkeyup_ = HA.onkeyup

onload_ :: AttributeValue -> Attribute
onload_ = HA.onload

onloadeddata_ :: AttributeValue -> Attribute
onloadeddata_ = HA.onloadeddata

onloadedmetadata_ :: AttributeValue -> Attribute
onloadedmetadata_ = HA.onloadedmetadata

onloadstart_ :: AttributeValue -> Attribute
onloadstart_ = HA.onloadstart

onmessage_ :: AttributeValue -> Attribute
onmessage_ = HA.onmessage

onmousedown_ :: AttributeValue -> Attribute
onmousedown_ = HA.onmousedown

onmousemove_ :: AttributeValue -> Attribute
onmousemove_ = HA.onmousemove

onmouseout_ :: AttributeValue -> Attribute
onmouseout_ = HA.onmouseout

onmouseover_ :: AttributeValue -> Attribute
onmouseover_ = HA.onmouseover

onmouseup_ :: AttributeValue -> Attribute
onmouseup_ = HA.onmouseup

onmousewheel_ :: AttributeValue -> Attribute
onmousewheel_ = HA.onmousewheel

ononline_ :: AttributeValue -> Attribute
ononline_ = HA.ononline

onpagehide_ :: AttributeValue -> Attribute
onpagehide_ = HA.onpagehide

onpageshow_ :: AttributeValue -> Attribute
onpageshow_ = HA.onpageshow

onpause_ :: AttributeValue -> Attribute
onpause_ = HA.onpause

onplay_ :: AttributeValue -> Attribute
onplay_ = HA.onplay

onplaying_ :: AttributeValue -> Attribute
onplaying_ = HA.onplaying

onprogress_ :: AttributeValue -> Attribute
onprogress_ = HA.onprogress

onpropstate_ :: AttributeValue -> Attribute
onpropstate_ = HA.onpropstate

onratechange_ :: AttributeValue -> Attribute
onratechange_ = HA.onratechange

onreadystatechange_ :: AttributeValue -> Attribute
onreadystatechange_ = HA.onreadystatechange

onredo_ :: AttributeValue -> Attribute
onredo_ = HA.onredo

onresize_ :: AttributeValue -> Attribute
onresize_ = HA.onresize

onscroll_ :: AttributeValue -> Attribute
onscroll_ = HA.onscroll

onseeked_ :: AttributeValue -> Attribute
onseeked_ = HA.onseeked

onseeking_ :: AttributeValue -> Attribute
onseeking_ = HA.onseeking

onselect_ :: AttributeValue -> Attribute
onselect_ = HA.onselect

onstalled_ :: AttributeValue -> Attribute
onstalled_ = HA.onstalled

onstorage_ :: AttributeValue -> Attribute
onstorage_ = HA.onstorage

onsubmit_ :: AttributeValue -> Attribute
onsubmit_ = HA.onsubmit

onsuspend_ :: AttributeValue -> Attribute
onsuspend_ = HA.onsuspend

ontimeupdate_ :: AttributeValue -> Attribute
ontimeupdate_ = HA.ontimeupdate

onundo_ :: AttributeValue -> Attribute
onundo_ = HA.onundo

onunload_ :: AttributeValue -> Attribute
onunload_ = HA.onunload

onvolumechange_ :: AttributeValue -> Attribute
onvolumechange_ = HA.onvolumechange

onwaiting_ :: AttributeValue -> Attribute
onwaiting_ = HA.onwaiting

open_ :: AttributeValue -> Attribute
open_ = HA.open

optimum_ :: AttributeValue -> Attribute
optimum_ = HA.optimum

pattern_ :: AttributeValue -> Attribute
pattern_ = HA.pattern

ping_ :: AttributeValue -> Attribute
ping_ = HA.ping

placeholder_ :: AttributeValue -> Attribute
placeholder_ = HA.placeholder

preload_ :: AttributeValue -> Attribute
preload_ = HA.preload

pubdate_ :: AttributeValue -> Attribute
pubdate_ = HA.pubdate

radiogroup_ :: AttributeValue -> Attribute
radiogroup_ = HA.radiogroup

readonly_ :: AttributeValue -> Attribute
readonly_ = HA.readonly

rel_ :: AttributeValue -> Attribute
rel_ = HA.rel

required_ :: AttributeValue -> Attribute
required_ = HA.required

reversed_ :: AttributeValue -> Attribute
reversed_ = HA.reversed

role_ :: AttributeValue -> Attribute
role_ = HA.role

rows_ :: AttributeValue -> Attribute
rows_ = HA.rows

rowspan_ :: AttributeValue -> Attribute
rowspan_ = HA.rowspan

sandbox_ :: AttributeValue -> Attribute
sandbox_ = HA.sandbox

scope_ :: AttributeValue -> Attribute
scope_ = HA.scope

scoped_ :: AttributeValue -> Attribute
scoped_ = HA.scoped

seamless_ :: AttributeValue -> Attribute
seamless_ = HA.seamless

selected_ :: AttributeValue -> Attribute
selected_ = HA.selected

shape_ :: AttributeValue -> Attribute
shape_ = HA.shape

size_ :: AttributeValue -> Attribute
size_ = HA.size

sizes_ :: AttributeValue -> Attribute
sizes_ = HA.sizes

span_' :: AttributeValue -> Attribute
span_' = HA.span

spellcheck_ :: AttributeValue -> Attribute
spellcheck_ = HA.spellcheck

src_ :: AttributeValue -> Attribute
src_ = HA.src

srcdoc_ :: AttributeValue -> Attribute
srcdoc_ = HA.srcdoc

start_ :: AttributeValue -> Attribute
start_ = HA.start

step_ :: AttributeValue -> Attribute
step_ = HA.step

style_' :: AttributeValue -> Attribute
style_' = HA.style

subject_ :: AttributeValue -> Attribute
subject_ = HA.subject

summary_' :: AttributeValue -> Attribute
summary_' = HA.summary

tabindex_ :: AttributeValue -> Attribute
tabindex_ = HA.tabindex

target_ :: AttributeValue -> Attribute
target_ = HA.target

title_' :: AttributeValue -> Attribute
title_' = HA.title

type_ :: AttributeValue -> Attribute
type_ = HA.type_

usemap_ :: AttributeValue -> Attribute
usemap_ = HA.usemap

value_ :: AttributeValue -> Attribute
value_ = HA.value

width_ :: AttributeValue -> Attribute
width_ = HA.width

wrap_ :: AttributeValue -> Attribute
wrap_ = HA.wrap

xmlns_ :: AttributeValue -> Attribute
xmlns_ = HA.xmlns

-----------------------------
-- Internal functions below
-----------------------------

content :: BI.ChoiceString -> BI.MarkupM ()
content cs = BI.Content cs ()

textFromChoiceString :: BI.ChoiceString -> TB.Builder
textFromChoiceString x = BLZT.renderMarkupBuilder (BI.Content x ())

fromChoiceString :: BI.ChoiceString -> BB.Builder
fromChoiceString x = BLZU.renderMarkupBuilder (BI.Content x ())

renderAttributeMarkup :: BI.MarkupM a -> BI.StaticString
renderAttributeMarkup x = case go (id,mempty,mempty) x of
  (sb,bb,tb) -> BI.StaticString
    sb
    (LB.toStrict (BB.toLazyByteString bb))
    (LT.toStrict (TB.toLazyText tb))
  where
  go :: (String -> String,BB.Builder,TB.Builder) -> BI.MarkupM b -> (String -> String,BB.Builder,TB.Builder)
  go (sb,bb,tb) (BI.AddAttribute _ key value h) =
    go ( BI.getString key . BLZS.fromChoiceString value . ('"' :) . sb
       , BB.byteString (BI.getUtf8ByteString key)
           <> fromChoiceString value
           <> BB.char7 '"'
           <> bb
       , TB.fromText (BI.getText key)
           <> textFromChoiceString value
           <> TB.singleton '"'
           <> tb
       ) h
  go (sb,bb,tb) _ = (sb,bb,tb)

liftParent :: Foldable t => BI.StaticString -> BI.StaticString -> t Attribute -> WidgetFor site a -> WidgetFor site a
liftParent open close attrs inner = do
  toWidget
    ( BI.Append
      (content (BI.Static open))
      (BI.Append
        (content (BI.Static (renderAttributeMarkup (BI.Empty () H.! fold attrs))))
        (content (BI.Static (fromString ">")))
      )
    )
  a <- inner
  toWidget $ content (BI.Static close)
  return a

liftLeaf :: Foldable t => Html -> t Attribute -> WidgetFor site ()
liftLeaf el attrs = toWidget (el H.! fold attrs)

