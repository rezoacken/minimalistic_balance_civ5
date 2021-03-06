INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_MINOR','[COLOR_NEGATIVE_TEXT]彼らは我々が急激に都市を建設していることに懸念を抱き始めている。[ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_MAJOR','[COLOR_NEGATIVE_TEXT]彼らは我々が急激に都市を建設していることに懸念を抱いている。[ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_SEVERE','[COLOR_NEGATIVE_TEXT]彼らは我々が急激に都市を建設していると考えている。[ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_CRITICAL','[COLOR_NEGATIVE_TEXT]彼らは我々が急激に都市を建設していることを脅威に感じている！[ENDCOLOR]'),
('TXT_KEY_DIPLO_CASUS_BELLI_US','我々には彼らに対する開戦事由がある！ (都市を占領しても戦争狂ペナルティを負わない)'),
('TXT_KEY_DIPLO_CASUS_BELLI_THEM','[COLOR_NEGATIVE_TEXT]彼らには我々に対する開戦事由がある！[ENDCOLOR]');
  
UPDATE Language_JA_JP Set Text='開拓者' WHERE Tag='TXT_KEY_HANDICAP_SETTLER';
UPDATE Language_JA_JP Set Text='初心者向け。' WHERE Tag='TXT_KEY_HANDICAP_SETTLER_HELP';
UPDATE Language_JA_JP Set Text='酋長' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN';
UPDATE Language_JA_JP Set Text='易しい。' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN_HELP';
UPDATE Language_JA_JP Set Text='将軍' WHERE Tag='TXT_KEY_HANDICAP_WARLORD';
UPDATE Language_JA_JP Set Text='普通。' WHERE Tag='TXT_KEY_HANDICAP_WARLORD_HELP';
UPDATE Language_JA_JP Set Text='皇子' WHERE Tag='TXT_KEY_HANDICAP_PRINCE';
UPDATE Language_JA_JP Set Text='難しい。' WHERE Tag='TXT_KEY_HANDICAP_PRINCE_HELP';
UPDATE Language_JA_JP Set Text='国王' WHERE Tag='TXT_KEY_HANDICAP_KING';
UPDATE Language_JA_JP Set Text='かなり難しい。' WHERE Tag='TXT_KEY_HANDICAP_KING_HELP';
UPDATE Language_JA_JP Set Text='皇帝' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR';
UPDATE Language_JA_JP Set Text='とてつもなく難しい。' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR_HELP';
UPDATE Language_JA_JP Set Text='不死者' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL';
UPDATE Language_JA_JP Set Text='精鋭プレイヤー者向けの難易度です。' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL_HELP';
  
UPDATE Language_JA_JP SET Text='すべての[COLOR_POSITIVE_TEXT]遠隔攻撃[ENDCOLOR]に対する[COLOR_POSITIVE_TEXT]防御[ENDCOLOR]+25%' WHERE Tag='TXT_KEY_PROMOTION_COVER_1_HELP';
UPDATE Language_JA_JP SET Text='すべての[COLOR_POSITIVE_TEXT]遠隔攻撃[ENDCOLOR]に対する[COLOR_POSITIVE_TEXT]防御[ENDCOLOR]+25%' WHERE Tag='TXT_KEY_PROMOTION_COVER_2_HELP';
UPDATE Language_JA_JP SET Text='対戦車ボーナス(50).' WHERE Tag='TXT_KEY_PROMOTION_ANTI_TANK';
/*
UPDATE Language_JA_JP SET Text='対都市ボーナス+150%。' WHERE Tag='TXT_KEY_PROMOTION_CITY_SIEGE_HELP';
UPDATE Language_JA_JP SET Text='対都市ボーナス(150)' WHERE Tag='TXT_KEY_PROMOTION_CITY_SIEGE';
*/
UPDATE Language_JA_JP SET Text='都市への攻撃ペナルティ(20)' WHERE Tag='TXT_KEY_PROMOTION_CITY_PENALTY';
UPDATE Language_JA_JP SET Text='都市への攻撃ペナルティ20%。' WHERE Tag='TXT_KEY_PROMOTION_CITY_PENALTY_HELP';
UPDATE Language_JA_JP SET Text='都市への攻撃ペナルティ(20)' WHERE Tag='TXT_KEY_SMALL_PROMOTION_CITY_PENALTY';
UPDATE Language_JA_JP SET Text='都市への攻撃ペナルティ20%。' WHERE Tag='TXT_KEY_SMALL_PROMOTION_CITY_PENALTY_HELP';
  
UPDATE Language_JA_JP SET Text='この都市が活用する近海と外洋から[ICON_FOOD]食料+1。[NEWLINE][NEWLINE]この都市が活用する[ICON_RES_FISH]魚から[ICON_FOOD]食料+1。[NEWLINE][NEWLINE]沿岸都市にしか建設できない'
WHERE Tag='TXT_KEY_BUILDING_LIGHTHOUSE_HELP';
UPDATE Language_JA_JP SET Text='この都市が活用する近海と外洋から[ICON_GOLD]ゴールド+1。[NEWLINE][NEWLINE][ICON_CAPITAL]首都と水路により[ICON_CONNECTED]都市の結びつきを形成する(まだ陸路で[ICON_CONNECTED]結ばれていない場合)。この都市から出発する海上交易路の到達可能距離が50%伸び、他の文明に接続すると[ICON_GOLD]ゴールド2が追加でもたらされる。[NEWLINE][NEWLINE]沿岸都市にしか建設できない。'
WHERE Tag='TXT_KEY_BUILDING_HARBOR_HELP';
UPDATE Language_JA_JP SET Text='この都市が活用する近海と外洋から[ICON_PRODUCTION]生産力+1。[NEWLINE][NEWLINE]海軍ユニットの[ICON_PRODUCTION]生産速度+15%。[NEWLINE][NEWLINE]沿岸都市にしか建設できない。'
WHERE Tag='TXT_KEY_BUILDING_SEAPORT_HELP';
  
UPDATE Language_JA_JP SET Text='この都市が活用する[ICON_RES_WHEAT]小麦、[ICON_RES_BANANA]バナナ、[ICON_RES_DEER]鹿、[ICON_RES_BISON]バイソンから[ICON_FOOD]食料+1。[NEWLINE][NEWLINE]この都市から国内交易路を利用して[ICON_FOOD]食料を輸送できる。' WHERE Tag='TXT_KEY_BUILDING_GRANARY_HELP';
UPDATE Language_JA_JP SET Text='この都市が活用する[ICON_RES_GOLD]金、[ICON_RES_SILVER]銀、[ICON_RES_COPPER]銅から[ICON_GOLD]ゴールド+2。[NEWLINE][NEWLINE]都市の近くでいずれか1つの資源を改善していなければならない。' WHERE Tag='TXT_KEY_BUILDING_MINT_HELP';
UPDATE Language_JA_JP SET Text='造幣所は近隣で金・銀・銅を活用している都市にのみ建設可能であり、それらの資源の[ICON_GOLD]ゴールド産出量を増加させる。' WHERE Tag='TXT_KEY_BUILDING_MINT_STRATEGY';
/*UPDATE Language_JA_JP SET Text='都市の近くに[ICON_RES_URANIUM]ウランが存在しなければならない。また、都市に太陽熱発電所がある場合は建設できない。' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';
UPDATE Language_JA_JP SET Text='原子力発電所は都市の生産力を大幅に上昇させる。原子力発電所を建設するには都市の近くに[ICON_RES_URANIUM]ウランが必要である。また、工場のない都市には建設できない。' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_STRATEGY';*/
UPDATE Language_JA_JP SET Text='この都市から出発する陸上交易路の到達可能距離が50%伸びる。他の文明に接続すると[ICON_GOLD]ゴールド3が追加でもたらされる。'
WHERE Tag='TXT_KEY_BUILDING_CARAVANSARY_HELP';
UPDATE Language_JA_JP SET Text='「敬虔」が必要。無償の伝道師が3人出現する。[NEWLINE][NEWLINE]聖都にしか建設できない。'
WHERE Tag='TXT_KEY_WONDER_BOROBUDUR_HELP';
UPDATE Language_JA_JP SET Text='この都市で誕生した伝道師は3回布教できる。この遺産を建設した都市に無償のモスクがもたらされる。[NEWLINE][NEWLINE]聖都にしか建設できない。'
WHERE Tag='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
UPDATE Language_JA_JP SET Text='新たなタイル獲得に必要な[ICON_CULTURE]文化力および[ICON_GOLD]ゴールドが各都市で25%軽減される。この遺産を建設した都市に無償の大学がもたらされる。'
WHERE Tag='TXT_KEY_WONDER_ANGKOR_WAT_HELP';
UPDATE Language_JA_JP SET Text='追加の交易路スロットが1つもたらされる。他のプレイヤーが東インド会社のある都市に交易路を引くと、さらに[ICON_GOLD]ゴールド4がその都市の所有者の懐に入る。また交易路を引いた側もさらに[ICON_GOLD]ゴールド2を得る。[NEWLINE][NEWLINE]すべての都市に市場が必要。自文明の都市数が多いほど建設コストが増す。'
WHERE Tag='TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';
UPDATE Language_JA_JP SET Text='新たに1人スパイを供給する。既存のスパイをレベルアップさせる。敵スパイの活動効率を15%低下させる。[NEWLINE][NEWLINE]すべての都市に警察庁が必要。自文明の都市数が多いほど建設コストが増す。'
WHERE Tag='TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';
UPDATE Language_JA_JP SET Text='所有している陸上軍事ユニットのコピーが1種類につき1つずつ作成され、兵馬俑を建設した都市の近くに配置される。「考古学」の研究が完了すると[ICON_CULTURE]文化力+5。'
WHERE Tag='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
UPDATE Language_JA_JP SET Text='「秩序」が必要。無償の社会制度を1つ獲得。この遺産を建設した都市の[ICON_PRODUCTION]生産力+20%。'
WHERE Tag='TXT_KEY_WONDER_KREMLIN_HELP';
  
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]美学[ENDCOLOR]は文明が[ICON_TOURISM]観光力を生み出す力を高める。[NEWLINE][NEWLINE]美学を採用すると、大著述家・大芸術家・大音楽家の誕生速度+25%。ウフィツィ美術館が建設可能になる。[NEWLINE][NEWLINE]美術ツリーの制度をすべて採用すると、博物館や遺産から得られるテーマ化ボーナスが2倍になるとともに、隠された史跡が明らかになる。また、産業時代からは[ICON_PEACE]信仰力を使って大音楽家を購入できるようになる。'
Where Tag='TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]芸術の開花[ENDCOLOR][NEWLINE][ICON_GOLDEN_AGE]黄金時代が開始する。[NEWLINE]世界遺産が存在する都市の[ICON_CULTURE]文化力+33%。'
Where Tag='TXT_KEY_POLICY_FLOURISHING_OF_ARTS_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]文化的拠点[ENDCOLOR][NEWLINE]円形競技場、オペラハウス、博物館、放送塔の建設速度+50%。[NEWLINE]考古学者の生産速度+50%。'
Where Tag='TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';
/*Update Language_JA_JP Set Text=''
Where Tag='TXT_KEY_POLICY_ETHICS_HELP';*/
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]巨匠[ENDCOLOR][NEWLINE]大芸術家が1人出現する。[NEWLINE]傑作が生み出す[ICON_TOURISM]観光力+1。'
Where Tag='TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]純粋芸術[ENDCOLOR][NEWLINE]円形競技場、オペラハウス、博物館、放送塔から[ICON_TOURISM]観光力+1。[NEWLINE]余剰[ICON_HAPPINESS_1]幸福度の50%が[ICON_CULTURE]文化力に追加される。'
Where Tag='TXT_KEY_POLICY_FINE_ARTS_HELP';
Update Language_JA_JP Set Text='考古学者ユニット'
Where Tag='TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST';
  
/*Update Language_JA_JP 
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT][COLOR_POSITIVE_TEXT]商業[ENDCOLOR]は[ICON_GOLD]ゴールドを求める文明に適したボーナスをもたらす。[NEWLINE][NEWLINE]商業を採用すると、首都の生み出す[ICON_GOLD]ゴールドが25%増加する。ビッグベンが建設可能になる。[NEWLINE][NEWLINE]商業ツリーの制度をすべて採用すると、[ICON_INTERNATIONAL_TRADE]交易路が1つ追加されるとともに、交易所から[ICON_GOLD]ゴールド+1がもたらされる。また、産業時代からは[ICON_PEACE]信仰力を使って大商人を購入できるようになる。'
Where Tag='TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';*/
Update Language_JA_JP 
Set Text='[COLOR_POSITIVE_TEXT]商人王朝[ENDCOLOR][NEWLINE]ランツクネヒトが購入可能になる。[NEWLINE]建造物を購入する度に、支払う[ICON_GOLD]ゴールドの15%が[ICON_CULTURE]文化力に追加される。'
Where Tag='TXT_KEY_POLICY_TRADE_UNIONS_HELP';
/*Update Language_JA_JP 
Set Text='[COLOR_POSITIVE_TEXT]企業家精神[ENDCOLOR][NEWLINE]専門家から[ICON_GOLD]ゴールド+1。[NEWLINE]通称任務により獲得する[ICON_GOLD]ゴールドが2倍になる。'
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_JA_JP Set Text=''
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_JA_JP Set Text=''
Where Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';*/
/*Update Language_JA_JP Set Text=''
Where Tag='TXT_KEY_POLICY_CARAVANS_HELP';*/
/*Update Language_JA_JP Set Text=''
Where Tag='TXT_KEY_POLICY_PROTECTIONISM_HELP';*/
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_TRADE_UNIONS_HEADER', '商人王朝');
  
/*Texts*/
/*Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]探検[ENDCOLOR]は海洋文明を強化する。[NEWLINE][NEWLINE]探検を採用すると、海軍ユニットに[ICON_MOVES]移動力+1、海軍戦闘ユニットに視程+1が与えられる。また、陸上ユニットは出航時の[ICON_MOVES]移動力が1増加する。ルーブル美術館が建設可能になる。[NEWLINE][NEWLINE]探検ツリーの制度をすべて採用すると、海軍ユニットの[ICON_STRENGTH]戦闘力と[ICON_RANGE_STRENGTH]遠隔戦闘力が15%増加する。また、産業時代からは[ICON_PEACE]信仰力を使って大提督を購入できるようになる。'
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';*/
/*Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]探検[ENDCOLOR][NEWLINE]'
Where Tag='TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';*/
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]海軍の栄誉[ENDCOLOR][NEWLINE]灯台、港、港湾から[ICON_HAPPINESS_1]幸福度+1。[NEWLINE]灯台、港、港湾の建設速度+50%。'
Where Tag='TXT_KEY_POLICY_NAVAL_TRADITION_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]商船隊[ENDCOLOR][NEWLINE]灯台、港、港湾から[ICON_GOLD]ゴールド+2。[NEWLINE]東インド会社から[ICON_CULTURE]文化力+4および[ICON_PRODUCTION]生産力+4。'
Where Tag='TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
/*Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT][ENDCOLOR][NEWLINE]'
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';*/
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]財宝艦隊[ENDCOLOR][NEWLINE]国外海上交易路から[ICON_GOLD]ゴールド+3、[ICON_RESEARCH]科学力+4、[ICON_CULTURE]文化力+2。'
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';
  
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_PROMOTION_EXPLORATION_FINISHER_BOOST', '探検の全採用'),
('TXT_KEY_PROMOTION_EXPLORATION_FINISHER_BOOST_HELP', '[ICON_STRENGTH]戦闘力+10%。');
  
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]名誉[ENDCOLOR]は攻撃的・軍事的な文明に最適だ。[NEWLINE][NEWLINE]名誉を採用すると、敵ユニットを倒す度に[ICON_CULTURE]文化力を獲得する(戦闘力の50%分)。また、対蛮族戦で+33%の戦闘ボーナスが与えられるうえ、探索済みの領土に新たな蛮族の野営地が出現するとメッセージが表示される。ゼウス像が建設可能になる。[NEWLINE][NEWLINE]名誉ツリーの制度をすべて採用すると、敵ユニットを倒す度に[ICON_GOLD]ゴールドを獲得する。裁判所の建設速度+50%。また、産業時代からは[ICON_PEACE]信仰力を使って大将軍を購入できるようになる。' Where Tag='TXT_KEY_POLICY_BRANCH_HONOR_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]軍隊の常備[ENDCOLOR][NEWLINE]軍事ユニットのアップグレードに必要な[ICON_GOLD]ゴールドが33%軽減される。兵舎、武器庫、士官学校の建設速度+100%。' Where Tag='TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]戦士階級[ENDCOLOR][NEWLINE]兵舎から[ICON_HAPPINESS_1]幸福度+1および[ICON_CULTURE]文化力+2。' Where Tag='TXT_KEY_POLICY_MILITARY_CASTE_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]戦士の掟[ENDCOLOR][NEWLINE]槍兵1体と弓兵1体を獲得する。[NEWLINE]2ユニットの維持費が不要になる。[NEWLINE]大将軍の誕生速度+50%。' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]規律[ENDCOLOR][NEWLINE]味方軍事ユニットに隣接している場合、白兵ユニットの[ICON_STRENGTH]戦闘力+15%。[NEWLINE]軍事ユニットが戦闘から獲得する経験値+50%。' Where Tag='TXT_KEY_POLICY_DISCIPLINE_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]軍の栄誉[ENDCOLOR][NEWLINE]大将軍が1人出現する。[NEWLINE]軍事ユニットの生産速度+15%。[NEWLINE]英雄叙事詩の建設速度+100%。' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';
  
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]秘密工作[ENDCOLOR][NEWLINE]都市国家に対する政変の成功確率が15%上昇する。[NEWLINE]成功確率に設定されている85%という上限が撤廃される。'
WHERE Tag='TXT_KEY_POLICY_COVERT_ACTION_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]経済同盟[ENDCOLOR][NEWLINE]他文明との交易路から[ICON_GOLD]ゴールド+3。'
WHERE Tag='TXT_KEY_POLICY_ECONOMIC_UNION_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]栄光の時代[ENDCOLOR][NEWLINE]既存都市の[ICON_STRENGTH]戦闘力が15増加し、ヒットポイントが50増加する。'
WHERE Tag='TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';
UPDATE Language_JA_JP SET Text='自友国領内で攻撃力+20%。' WHERE Tag='TXT_KEY_PROMOTION_NATIONALISM_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]祖国戦争[ENDCOLOR][NEWLINE]自友国領内で攻撃力+20%。'
WHERE Tag='TXT_KEY_POLICY_PATRIOTIC_WAR_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]二重スパイ[ENDCOLOR][NEWLINE]スパイのレベルが1上昇する。'
WHERE Tag='TXT_KEY_POLICY_DOUBLE_AGENTS_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]党執行部[ENDCOLOR][NEWLINE]全都市の[ICON_FOOD]食料、[ICON_PRODUCTION]生産力、[ICON_RESEARCH]科学力、[ICON_GOLD]ゴールド、[ICON_CULTURE]文化力、[ICON_PEACE]信仰力+2。'
WHERE Tag='TXT_KEY_POLICY_PARTY_LEADERSHIP_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]移住[ENDCOLOR][NEWLINE]開拓者の生産速度+100%。[NEWLINE]新たに建設する都市に[ICON_CITIZEN]人口+3。'
WHERE Tag='TXT_KEY_POLICY_RESETTLEMENT_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]未来派[ENDCOLOR][NEWLINE]大著述家・大芸術家・大音楽家が誕生すると、これまでに接触している全文明に対し[ICON_TOURISM]観光力400を及ぼす。'
WHERE Tag='TXT_KEY_POLICY_FUTURISM_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]第三の位置[ENDCOLOR][NEWLINE]戦略資源の数量+100%。[NEWLINE][ICON_CAPITAL]首都の[ICON_FOOD]食料+5および[ICON_PRODUCTION]生産力+5。'
WHERE Tag='TXT_KEY_POLICY_THIRD_ALTERNATIVE_HELP';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]統一戦線[ENDCOLOR][NEWLINE]軍事都市国家によるユニット供給頻度が2倍になる。'
WHERE Tag='TXT_KEY_POLICY_UNITED_FRONT_HELP';
  
UPDATE Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]解放[ENDCOLOR]は迅速な領土拡大を望む文明に最適だ。[NEWLINE][NEWLINE]解放を採用すると、全都市に[ICON_CULTURE]文化力1がもたらされる。ピラミッドが建設可能になる。[NEWLINE][NEWLINE]解放ツリーの制度をすべて採用すると、[ICON_CAPITAL]首都の近くに選択可能な[ICON_GREAT_PEOPLE]偉人が1人出現する。' WHERE Tag='TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]共和制[ENDCOLOR][NEWLINE]全都市の[ICON_PRODUCTION]生産力+1。[NEWLINE]建造物の[ICON_PRODUCTION]建設速度+10%。' WHERE Tag='TXT_KEY_POLICY_REPUBLIC_HELP';
  
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]文化後援[ENDCOLOR]は都市国家との友好関係による恩恵を増やす。[NEWLINE][NEWLINE]文化後援を採用すると、都市国家に対する[ICON_INFLUENCE]影響力の低下速度が通常より25%緩やかになる。紫禁城が建設可能になる。[NEWLINE][NEWLINE]文化後援ツリーの制度をすべて採用すると、[COLOR_POSITIVE_TEXT]同盟[ENDCOLOR]関係にある都市国家から時折に[ICON_GREAT_PEOPLE]偉人が贈られてくる上、クエストの発生頻度が2倍になる。'
Where Tag='TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]博愛主義[ENDCOLOR][NEWLINE]都市国家に[ICON_GOLD]ゴールドを贈ることで獲得できる[ICON_INFLUENCE]影響力+25%。'
Where Tag='TXT_KEY_POLICY_PHILANTHROPY_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]スコラ学[ENDCOLOR][NEWLINE]都市国家への交易路から[ICON_RESEARCH]科学力+3。[NEWLINE]同盟関係にある全都市国家から、プレイヤーのいる時代に基づいて[ICON_RESEARCH]科学力がもたらされる。'
Where Tag='TXT_KEY_POLICY_SCHOLASTICISM_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]商人連合[ENDCOLOR][NEWLINE]都市国家への交易路から[ICON_GOLD]ゴールド+4および[ICON_CULTURE]文化力+3。[NEWLINE]交易路を設定した都市国家に対する[ICON_INFLUENCE]影響力が毎ターン1ずつ増加する。'
Where Tag='TXT_KEY_POLICY_MERCHANT_CONFEDERACY_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]領事館[ENDCOLOR][NEWLINE]全都市国家に対する[ICON_INFLUENCE]影響力の基礎値+15。[NEWLINE]都市国家からのクエストが1つ追加される。'
Where Tag='TXT_KEY_POLICY_CONSULATES_HELP';
  
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]敬虔[ENDCOLOR]は宗教を重視する文明に最適だ。[NEWLINE][NEWLINE]敬虔を採用すると、[ICON_CAPITAL]首都に[ICON_PEACE]信仰力1が与えられるとともに、神殿と寺院の建設速度+100%。ボロブドゥールが建設可能になる。[NEWLINE][NEWLINE]敬虔ツリーの制度をすべて採用すると、大預言者が1人出現する。また、都市で2番目に信徒の多い宗教についても、パンテオン信仰と信徒の信仰の証によるボーナスを獲得できる。' Where Tag='TXT_KEY_POLICY_BRANCH_PIETY_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]天命[ENDCOLOR][NEWLINE][ICON_PEACE]信仰力よる宗教ユニットと宗教建造物の購入コストが20%軽減される。' Where Tag='TXT_KEY_POLICY_MANDATE_OF_HEAVEN_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]宗教の組織化[ENDCOLOR][NEWLINE]神殿と寺院から[ICON_PEACE]信仰力+1および[ICON_CULTURE]文化力+1。' Where Tag='TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]宗教熱[ENDCOLOR][NEWLINE]プレイヤーの宗教を信奉する自国都市1つにつき[ICON_HAPPINESS_1]幸福度+1。[NEWLINE]プレイヤーの宗教を信奉する他国都市3つにつき[ICON_HAPPINESS_1]幸福度+1。' Where Tag='TXT_KEY_POLICY_FREE_RELIGION_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]神権政治[ENDCOLOR][NEWLINE]神殿から[ICON_GOLD]ゴールド+2。[NEWLINE]聖地から[ICON_GOLD]ゴールド+3。[NEWLINE]寺院がある都市の[ICON_GOLD]ゴールド+15%。' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]改革[ENDCOLOR][NEWLINE]大預言者が誕生する度に、この宗教の信徒数と同数の[ICON_GOLD]ゴールド、[ICON_PRODUCTION]生産力、[ICON_GOLDEN_AGE]黄金時代ポイントが[ICON_CAPITAL]首都にもたらされる(最大で100)。[NEWLINE]宗教を創始した場合、改革の信仰の証を選択できる。' Where Tag='TXT_KEY_POLICY_REFORMATION_HELP';
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_FREE_RELIGION_HEADER', '宗教熱');
  
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]合理主義[ENDCOLOR]は[ICON_RESEARCH]科学力を生み出し、活用する力を高める。[NEWLINE][NEWLINE]合理主義を採用すると、大科学者の誕生速度+25%。南京の陶塔が建設可能になる。[NEWLINE][NEWLINE]合理主義ツリーの制度をすべて採用すると、テクノロジーを無償で1つ獲得できる。また、産業時代からは[ICON_PEACE]信仰力を使って大科学者を購入できるようになる。'
Where Tag='TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]人間主義[ENDCOLOR][NEWLINE]文明が[ICON_HAPPINESS_1]幸福状態にある間[ICON_RESEARCH]科学力+10%。'
Where Tag='TXT_KEY_POLICY_HUMANISM_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]政教分離主義[ENDCOLOR][NEWLINE]専門家から[ICON_RESEARCH]科学力+1。[NEWLINE]偉人による地形改善から[ICON_RESEARCH]科学力+2。'
Where Tag='TXT_KEY_POLICY_SECULARISM_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]主権[ENDCOLOR][NEWLINE]科学建造物から[ICON_GOLD]ゴールド+1および[ICON_PRODUCTION]生産力+1。'
Where Tag='TXT_KEY_POLICY_SOVEREIGNTY_HELP';
Update Language_JA_JP Set Text='[ICON_BULLET][COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] (交易路から)'
Where Tag='TXT_KEY_TP_CULTURE_FROM_TRAITS';
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_CO_CITY_TOURISM_BUILDINGCLASS', '{1_Num} [ICON_TOURISM]観光力 (建造物から)');
  
UPDATE Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]寡頭制[ENDCOLOR][NEWLINE]最初の4都市に無償の防衛建造物がもたらされる。[NEWLINE]駐留しているユニットの維持費が不要になる。' WHERE Tag='TXT_KEY_POLICY_OLIGARCHY_HELP';
UPDATE Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]地主エリート[ENDCOLOR][NEWLINE][ICON_CAPITAL]首都の[ICON_FOOD]成長速度+15%および[ICON_FOOD]食料+2。' WHERE Tag='TXT_KEY_POLICY_LANDED_ELITE_HELP';
  
INSERT INTO Language_JA_JP
(Tag,Text) VALUES
('TXT_KEY_PRODMOD_RELIGION_SETTLER','[NEWLINE][ICON_BULLET]開拓者に対するパンテオン信仰の修正値: {1_Num}%');
Update Language_JA_JP Set Text='人口が2以上ある都市の[ICON_PRODUCTION]生産力+1。' Where
Tag='TXT_KEY_BELIEF_GOD_CRAFTSMEN';
Update Language_JA_JP Set Text='神殿から[ICON_CULTURE]文化力+2。' Where
Tag='TXT_KEY_BELIEF_ANCESTOR_WORSHIP';
Update Language_JA_JP Set Text='ツンドラから[ICON_PEACE]信仰力+1。' Where
Tag='TXT_KEY_BELIEF_DANCE_AURORA';
/*Update Language_JA_JP Set Text='+20 HP healed per turn in your own territory' Where
Tag='TXT_KEY_BELIEF_FAITH_HEALERS';*/
Update Language_JA_JP Set Text='自分の都市から6タイル以内で戦闘に勝利すると、相手の戦闘力と同数の[ICON_PEACE]信仰力を獲得する。' Where
Tag='TXT_KEY_BELIEF_GOD_WAR';
Update Language_JA_JP Set Text='宮殿から以下の産出量+1: [ICON_FOOD]、[ICON_CULTURE]、[ICON_PEACE]、[ICON_GOLD]、[ICON_PRODUCTION]、[ICON_RESEARCH]、[ICON_HAPPINESS_1]' Where
Tag='TXT_KEY_BELIEF_GOD_KING';
Update Language_JA_JP Set Text='国境拡張速度+25%および首都で開拓者の[ICON_PRODUCTION]生産速度+20%。' Where
Tag='TXT_KEY_BELIEF_RELIGIOUS_SETTLEMENTS';
Update Language_JA_JP Set Text='全都市の[ICON_STRENGTH]戦闘力+5(更新に1ターン必要)' Where
Tag='TXT_KEY_BELIEF_GODDESS_STRATEGY';
Update Language_JA_JP Set Text='古代/古典/中世遺産の[ICON_PRODUCTION]建設速度+20%。' Where
Tag='TXT_KEY_BELIEF_MONUMENT_GODS';
Update Language_JA_JP Set Text='人口が4以上ある都市の[ICON_HAPPINESS_1]幸福度+1。' Where
Tag='TXT_KEY_BELIEF_GODDESS_LOVE';
Update Language_JA_JP Set Text='大規模農場から[ICON_PEACE]信仰力+1。' Where
Tag='TXT_KEY_BELIEF_ORAL_TRADITION';
Update Language_JA_JP Set Text='[ICON_RES_IRON]鉄と[ICON_RES_SALT]塩から[ICON_PEACE]信仰力+1。' Where
Tag='TXT_KEY_BELIEF_EARTH_MOTHER';
Update Language_JA_JP Set Text='[ICON_RES_GOLD]金、[ICON_RES_SILVER]銀、[ICON_RES_COPPER]銅から[ICON_PEACE]信仰力+1および[ICON_GOLD]ゴールド+1。' Where
Tag='TXT_KEY_BELIEF_FORMAL_LITURGY';
INSERT INTO Language_JA_JP
(Tag,Text) VALUES
('TXT_KEY_BELIEF_CEREMONIAL_ROBES','[ICON_RES_SILK]絹、[ICON_RES_COTTON]綿、[ICON_RES_DYE]染料から[ICON_CULTURE]文化力+2。'),
('TXT_KEY_BELIEF_CEREMONIAL_ROBES_SHORT','儀式のローブ'),
('TXT_KEY_BELIEF_OFFERINGS_GODS','[ICON_RES_TRUFFLES]トリュフ、[ICON_RES_SUGAR]砂糖、[ICON_RES_SPICES]香辛料から[ICON_PEACE]信仰力+1および[ICON_CULTURE]文化力+1。'),
('TXT_KEY_BELIEF_OFFERINGS_GODS_SHORT','神々への供物'),
('TXT_KEY_BELIEF_NATURES_BLESSING','森林から[ICON_PEACE]信仰力+1。'),
('TXT_KEY_BELIEF_NATURES_BLESSING_SHORT','自然の恵み'),
('TXT_KEY_BELIEF_GIFTS_WISDOM','[ICON_RES_COCOA]カカオから[ICON_RESEARCH]科学力+1。'),
('TXT_KEY_BELIEF_GIFTS_WISDOM_SHORT','知惠の贈り物');
Update Language_JA_JP Set Text='円形競技場から[ICON_PEACE]信仰力+1。オペラハウスから[ICON_PEACE]信仰力+2。' Where
Tag='TXT_KEY_BELIEF_LITURGICAL_DRAMA';
Update Language_JA_JP Set Text='[ICON_PEACE]信仰力でパゴダを購入([ICON_PEACE]信仰力+2、[ICON_CULTURE]文化力+1、[ICON_HAPPINESS_1]幸福度+2)。' Where
Tag='TXT_KEY_BELIEF_PAGODAS';
Update Language_JA_JP Set Text='[ICON_PEACE]信仰力で大聖堂を購入([ICON_PEACE]信仰力+1、[ICON_CULTURE]文化力+2、[ICON_HAPPINESS_1]幸福度+1、傑作芸術スロット1)。' Where
Tag='TXT_KEY_BELIEF_CATHEDRALS';
Update Language_JA_JP Set Text='神殿から[ICON_HAPPINESS_1]幸福度+1。' Where
Tag='TXT_KEY_BELIEF_ASCETISM';
Update Language_JA_JP Set Text='寺院から[ICON_CULTURE]文化力+2。オペラハウスから[ICON_CULTURE]文化力+1。' Where
Tag='TXT_KEY_BELIEF_CHORAL_MUSIC';
Update Language_JA_JP Set Text='エルミタージュ美術館から[ICON_CULTURE]文化力+8および[ICON_TOURISM]観光力+8。' Where
Tag='TXT_KEY_BELIEF_RELIGIOUS_ART';
/*
Update Language_JA_JP Set Text='寺院から[ICON_FOOD]食料+1。寺院から[ICON_FOOD]食料+2。' Where
Tag='TXT_KEY_BELIEF_FEED_WORLD';
*/
Update Language_JA_JP Set Text='この宗教の信徒5人につき[ICON_GOLD]ゴールド+1。' Where
Tag='TXT_KEY_BELIEF_TITHE';
Update Language_JA_JP Set Text='他国都市にいるこの宗教の信徒7人につき[ICON_HAPPINESS_1]大域的幸福度+1。' Where
Tag='TXT_KEY_BELIEF_PEACE_LOVING';
Update Language_JA_JP Set Text='偉人を消費する度に[ICON_PEACE]信仰力75を獲得する。' Where
Tag='TXT_KEY_BELIEF_RELIQUARY';
Update Language_JA_JP Set Text='伝道師の改宗力+40%。' Where
Tag='TXT_KEY_BELIEF_MISSIONARY_ZEAL';
Update Language_JA_JP Set Text='大聖堂、モスク、修道院、パゴダから[ICON_TOURISM]観光力+1、[ICON_CULTURE]文化力+1[ICON_GOLD]ゴールド+1。' Where
Tag='TXT_KEY_BELIEF_SACRED_SITES';
INSERT INTO Language_JA_JP
(Tag,Text) VALUES
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE','[ICON_PEACE]信仰力によってオペラハウス、博物館、放送塔を建設することができる。'),
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE_SHORT','芸術のパトロン');
  
/*Newtexts*/
UPDATE Language_JA_JP SET Text='アッシリア固有の図書館。この都市の[ICON_CITIZEN]市民2人につき[ICON_RESEARCH]科学力+1。傑作書物のスロットを1つ備え、ここに傑作書物を収めると、生産するユニットの経験値が15増加する。'
WHERE Tag='TXT_KEY_BUILDING_ROYAL_LIBRARY_HELP';
UPDATE Language_JA_JP SET Text='「筆記」の研究が完了すると大著述家が出現する。都市を征服すると、その都市の所有者が発見しているテクノロジーを1つ無償で獲得できる。取引によって得た都市は考慮されない。また、敵の都市1つにつき1度しか発動しない。'
WHERE Tag='TXT_KEY_TRAIT_SLAYER_OF_TIAMAT';
UPDATE Language_JA_JP SET Text='ビザンチン固有の騎兵。ゲーム序盤に登場する、機動力のある強力な騎乗ユニット。信仰力でいつでも購入可能。槍兵を弱点としている。騎兵よりも[ICON_STRENGTH]戦闘力と防衛力が高く、都市攻撃も効果的に行うことができる。'
WHERE Tag='TXT_KEY_UNIT_HELP_BYZANTINE_CATAPHRACT';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]自由思想[ENDCOLOR][NEWLINE]大学から[ICON_RESEARCH]科学力+17%。[NEWLINE]オックスフォード大学から[ICON_RESEARCH]科学力+7。'
Where Tag='TXT_KEY_POLICY_FREE_THOUGHT_HELP';
UPDATE Language_JA_JP SET Text='宗教を創始すると、信仰の証を通常より1つ多く選択できる。'
WHERE Tag='TXT_KEY_TRAIT_EXTRA_BELIEF';
UPDATE Language_JA_JP SET Text='すべての文明が核兵器(原子爆弾と核ミサイル)を新たに生産することを禁じられる。ただし、生産済みの核兵器が廃棄されることはない。[NEWLINE][NEWLINE]いずれかの文明が「核融合反応」を発見すると選択可能になる。'
WHERE Tag='TXT_KEY_RESOLUTION_NUCLEAR_NON_PROLIFERATION_HELP';
 
Update Language_JA_JP Set Text='宗教熱' Where Tag='TXT_KEY_POLICY_FREE_RELIGION';
Update Language_JA_JP Set Text='Civilopedia Placeholder' Where Tag='TXT_KEY_POLICY_FREERELIGION_TEXT';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]表現の自由[ENDCOLOR][NEWLINE]専門家から[ICON_RESEARCH]科学力+1。'
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';
UPDATE Language_JA_JP SET Text='表現の自由'
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION';
UPDATE Language_JA_JP SET Text='Civilopedia placeholder'
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_TEXT';
UPDATE Language_JA_JP SET Text='「名誉」が必要。都市に対する[ICON_STRENGTH]攻撃力+15%。占領後の反乱期間が半減する。'
WHERE Tag='TXT_KEY_WONDER_STATUE_ZEUS_HELP';
Update Language_JA_JP Set Text='「商業」が必要。全都市でユニットと建造物の[ICON_GOLD]購入費用-10%。' Where
Tag='TXT_KEY_WONDER_BIG_BEN_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]重商主義[ENDCOLOR][NEWLINE]ユニットと建造物の[ICON_GOLD]購入費用-15%。[NEWLINE]造幣局、市場、銀行、証券取引所から[ICON_RESEARCH]科学力+1。' Where
Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]神権政治[ENDCOLOR][NEWLINE]聖地から[ICON_GOLD]ゴールド+3。[NEWLINE]神殿から[ICON_GOLD]ゴールド+2。[NEWLINE]寺院がある都市の[ICON_GOLD]ゴールド+15%。' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_CIV5_IMPROVEMENTS_TRADING_POST_HELP','高級資源に隣接するタイルにしか建設できない。交易所同士が隣接するタイルには建設できない。');
UPDATE Language_JA_JP SET Text='全沿岸都市に無償の港がもたらされる。沿岸都市が活用する近海と外洋に[ICON_GOLD]ゴールド+2。大将軍を獲得すると、ユニットが山岳タイル上を移動できるようになる。山岳タイルでターンを終了したユニットは50HPのダメージを受ける。'
WHERE Tag='TXT_KEY_TRAIT_PHOENICIAN_HERITAGE';
INSERT INTO Language_JA_JP
(Text, Tag) Values
('Civilopedia placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_PEDIA'),
('近海と外洋から[ICON_GOLD]ゴールド+2。[NEWLINE][NEWLINE][ICON_CAPITAL]首都と水路により[ICON_CONNECTED]都市の結びつきを形成する。この都市から出る海上交易路の到達可能距離が50%伸び、他の文明に接続すると[ICON_GOLD]ゴールド2が追加でもたらされる。[NEWLINE][NEWLINE]沿岸都市にしか建設できない。',
'TXT_KEY_BUILDING_COTHON_HELP'),
('コトン',
'TXT_KEY_BUILDING_COTHON'),
('Strategy placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_STRATEGY');
INSERT INTO Language_JA_JP
(Text, Tag) Values
('Civilopedia placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_PEDIA'),
('この都市で[ICON_GREAT_PEOPLE]偉人の誕生速度+25%。',
'TXT_KEY_BUILDING_FORUM_HELP'),
('フォルム',
'TXT_KEY_BUILDING_FORUM'),
('Strategy placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_STRATEGY');
UPDATE Language_JA_JP SET Text='建造物の[ICON_PRODUCTION]建設速度+10%。首都に存在する建造物は追加で[ICON_PRODUCTION]建設速度+15%。'
WHERE Tag='TXT_KEY_TRAIT_CAPITAL_BUILDINGS_CHEAPER';
INSERT INTO Language_JA_JP
(Text, Tag) Values
('[NEWLINE][ICON_BULLET]建造物に対する文明の修正値: {1_Num}%','TXT_KEY_PRODMOD_BUILDING_TRAIT_PLAYER');
UPDATE Trait_SpecialistYieldChanges SET Yield=1 WHERE TraitType='TRAIT_SCHOLARS_JADE_HALL';
UPDATE Language_JA_JP SET Text='全ての専門家に[ICON_RESEARCH]科学力+1。偉人改善に[ICON_RESEARCH]科学力+2。朝鮮の首都に科学系の建造物/遺産を建設する度に一時的な科学力がもたらされる。'
WHERE Tag='TXT_KEY_TRAIT_SCHOLARS_JADE_HALL';
UPDATE Language_JA_JP SET Text='[COLOR_POSITIVE_TEXT]産業スパイ[ENDCOLOR][NEWLINE]スパイがテクノロジーを盗む速度が33%上昇する。'
WHERE Tag='TXT_KEY_POLICY_INDUSTRIAL_ESPIONAGE_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]植民地[ENDCOLOR][NEWLINE]新たに建設する都市に、追加[ICON_CITIZEN]人口1、労働者1、[ICON_HAPPINESS_1]幸福度1がもたらされる。'
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
Update Language_JA_JP Set Text='植民地'
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL';
Update Language_JA_JP Set Text='Civilopedia placeholder'
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_TEXT';
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC','総督公邸'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_PEDIA','探検ツリーの「植民地」採用後に建設した都市に建設される。'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_STRATEGY','「植民地」を採用した後に建設した都市は、追加[ICON_CITIZEN]人口1、労働者1、[ICON_HAPPINESS_1]幸福度1がもたらされる。');
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]財宝艦隊[ENDCOLOR][NEWLINE]海洋資源のない近海・外洋タイルから[ICON_PRODUCTION]生産力+1および[ICON_GOLD]ゴールド+1。'
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';
INSERT INTO Language_JA_JP
(Tag, Text) VALUES
('TXT_KEY_BUILDING_TREASURE_FLEETS_DESC','貯蔵庫'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_PEDIA','探検ツリーの「財宝艦隊」を採用すると建設される。'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_STRATEGY','海洋資源のない近海・外洋タイルから[ICON_PRODUCTION]生産力+1および[ICON_GOLD]ゴールド+1。');
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]探検[ENDCOLOR]は海洋文明を強化する。[NEWLINE][NEWLINE]探検を採用すると、海軍ユニットと出航ユニットに[ICON_MOVES]移動力+1、海軍戦闘ユニットに視程+1が与えられる。ルーブル美術館が建設可能になる。[NEWLINE][NEWLINE]探検ツリーの制度をすべて採用すると、海軍ユニットの[ICON_STRENGTH]戦闘力と[ICON_RANGE_STRENGTH]遠隔戦闘力が10%増加する。さらに、大提督の移動力が2上昇するとともに、無償の大提督が1人もたらされ、大提督の誕生速度が50%上昇する。また、産業時代からは[ICON_PEACE]信仰力を使って大提督を購入できるようになる。'
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
UPDATE Language_JA_JP SET Text='この都市で[ICON_GREAT_PEOPLE]偉人の誕生速度+25%。[NEWLINE]傑作スロットにあらかじめ傑作芸術が1つ収められている。'
WHERE Tag='TXT_KEY_WONDER_PARTHENON_HELP';

Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic gives +4 [ICON_HAPPINESS_1] Happiness. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';
Update Language_JA_JP Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 2 warriors and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';

UPDATE Language_JA_JP SET Text='1 free Great Musician appears near the City where the Wonder was built.' 
WHERE Tag='TXT_KEY_WONDER_CN_TOWER_HELP';
UPDATE Buildings SET InstantMilitaryIncrease=1 WHERE Type='BUILDING_PENTAGON';
UPDATE Language_JA_JP SET Text='[ICON_GOLD] Gold cost of upgrading military units reduced by 33%. And get a copy of each distinct land unit you have.' 
WHERE Tag='TXT_KEY_WONDER_PENTAGON_HELP';