CREATE TABLE IF NOT EXISTS raw_input (
    value TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS bag_rules (
    outer_bag TEXT,
    value INTEGER,
    inner_bag TEXT
);

CREATE TABLE IF NOT EXISTS bag_contents(
    bag TEXT UNIQUE,
    value INTEGER
);

/*
INSERT OR IGNORE INTO raw_input VALUES('light red bags contain 1 bright white bag, 2 muted yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark orange bags contain 3 bright white bags, 4 muted yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright white bags contain 1 shiny gold bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark olive bags contain 3 faded blue bags, 4 dotted black bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded blue bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted black bags contain no other bags.');
*/

INSERT OR IGNORE INTO raw_input VALUES('posh brown bags contain 5 dim coral bags, 1 plaid blue bag, 2 faded bronze bags, 2 light black bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant lime bags contain 3 dull lavender bags, 3 dim crimson bags, 3 mirrored lavender bags, 2 muted cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear olive bags contain 1 wavy gold bag, 4 dim lime bags, 3 dull tomato bags, 5 dark turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark purple bags contain 5 striped tan bags, 5 bright cyan bags, 3 dark indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh maroon bags contain 3 bright salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim violet bags contain 1 pale violet bag, 1 bright gold bag.');
INSERT OR IGNORE INTO raw_input VALUES('clear gray bags contain 1 bright gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('light brown bags contain 1 light aqua bag, 4 vibrant yellow bags, 5 posh green bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted yellow bags contain 4 drab bronze bags, 2 dull gray bags, 2 vibrant olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped orange bags contain 4 mirrored brown bags, 4 plaid olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped turquoise bags contain 2 muted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored crimson bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted teal bags contain 4 striped purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('light purple bags contain 5 dim coral bags, 3 striped teal bags, 1 dim teal bag, 4 clear gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny olive bags contain 2 muted cyan bags, 1 wavy white bag, 4 light chartreuse bags, 4 mirrored indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim black bags contain 4 wavy lavender bags, 5 drab blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale maroon bags contain 5 vibrant olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted maroon bags contain 2 faded lime bags, 1 clear turquoise bag.');
INSERT OR IGNORE INTO raw_input VALUES('light aqua bags contain 5 dark brown bags, 2 shiny gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant beige bags contain 2 pale cyan bags, 2 dotted crimson bags, 2 vibrant teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped white bags contain 2 shiny gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('light orange bags contain 1 dim coral bag, 2 vibrant coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull green bags contain 1 plaid green bag.');
INSERT OR IGNORE INTO raw_input VALUES('shiny turquoise bags contain 3 striped olive bags, 3 drab cyan bags, 2 dim lime bags, 3 muted brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh chartreuse bags contain 2 mirrored indigo bags, 3 light black bags, 4 mirrored bronze bags, 3 light gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab green bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab plum bags contain 3 pale blue bags, 4 dull teal bags, 1 striped violet bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted indigo bags contain 5 dark turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale beige bags contain 4 wavy gray bags, 4 faded lime bags, 4 bright beige bags, 1 plaid violet bag.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant blue bags contain 5 drab tan bags, 4 dull tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant turquoise bags contain 1 posh lavender bag.');
INSERT OR IGNORE INTO raw_input VALUES('clear maroon bags contain 2 shiny brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright crimson bags contain 2 faded indigo bags, 4 dull teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy tan bags contain 5 dotted fuchsia bags, 2 muted fuchsia bags, 2 light white bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim teal bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded plum bags contain 1 faded cyan bag, 4 dull lime bags, 2 vibrant cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant orange bags contain 3 plaid salmon bags, 3 mirrored yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh gray bags contain 4 dark indigo bags, 3 light blue bags, 5 light red bags, 3 pale aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull aqua bags contain 1 dark fuchsia bag, 2 faded silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('light bronze bags contain 1 muted indigo bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale coral bags contain 1 plaid tomato bag, 4 faded plum bags, 2 mirrored turquoise bags, 1 posh lavender bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale lime bags contain 1 dotted gray bag, 3 mirrored coral bags, 5 pale silver bags, 5 mirrored yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny violet bags contain 2 faded orange bags, 3 muted indigo bags, 5 muted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant coral bags contain 3 posh fuchsia bags, 1 dim coral bag, 4 faded gold bags, 5 dotted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim magenta bags contain 3 pale purple bags, 4 plaid turquoise bags, 2 bright lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull brown bags contain 5 vibrant turquoise bags, 3 faded bronze bags, 3 striped tan bags, 4 dim gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright brown bags contain 5 dark teal bags, 2 posh indigo bags, 4 drab fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim tan bags contain 4 dark magenta bags, 1 clear blue bag, 2 vibrant olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid black bags contain 4 pale indigo bags, 3 clear gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted plum bags contain 3 faded brown bags, 5 drab orange bags, 5 dull turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('light tomato bags contain 3 wavy coral bags, 2 drab green bags, 2 dull crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull cyan bags contain 1 clear blue bag, 3 clear yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear turquoise bags contain 5 pale black bags, 1 pale brown bag, 5 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded cyan bags contain 4 mirrored tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored coral bags contain 4 pale gold bags, 5 wavy gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted beige bags contain 4 faded crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid tan bags contain 5 bright indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded gray bags contain 3 muted salmon bags, 3 shiny maroon bags, 3 faded orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant teal bags contain 1 drab green bag, 1 pale black bag, 5 faded gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim red bags contain 5 striped olive bags, 4 drab salmon bags, 4 dark magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright teal bags contain 4 drab green bags, 3 shiny brown bags, 1 mirrored crimson bag, 1 dotted purple bag.');
INSERT OR IGNORE INTO raw_input VALUES('wavy silver bags contain 4 wavy coral bags, 2 bright aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab gray bags contain 4 drab crimson bags, 4 faded turquoise bags, 3 drab lavender bags, 3 bright bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant gold bags contain 2 muted black bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded brown bags contain 3 posh fuchsia bags, 3 faded tan bags, 1 dim olive bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale red bags contain 4 clear orange bags, 3 striped green bags, 5 striped turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded coral bags contain 3 dim lime bags, 2 pale indigo bags, 1 striped red bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted cyan bags contain 5 vibrant aqua bags, 2 muted violet bags, 3 clear gold bags, 5 pale maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright silver bags contain 3 posh salmon bags, 1 posh silver bag, 1 clear teal bag, 3 dark gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant magenta bags contain 2 dark violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored magenta bags contain 4 drab teal bags, 1 dark purple bag.');
INSERT OR IGNORE INTO raw_input VALUES('posh orange bags contain 5 dim teal bags, 5 clear lavender bags, 2 dim coral bags, 3 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted gray bags contain 1 dim blue bag, 3 striped purple bags, 3 mirrored coral bags, 5 clear purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark white bags contain 5 dim teal bags, 5 dark turquoise bags, 3 wavy indigo bags, 5 muted olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh black bags contain 5 striped purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded teal bags contain 2 muted beige bags, 4 dim blue bags, 3 light purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('light maroon bags contain 5 dotted lime bags, 3 mirrored salmon bags, 2 dark coral bags, 4 muted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped violet bags contain 5 mirrored turquoise bags, 1 light green bag, 1 striped tan bag, 4 faded violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted red bags contain 4 bright aqua bags, 2 dull maroon bags, 3 plaid fuchsia bags, 2 dim green bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny salmon bags contain 4 pale chartreuse bags, 1 muted tomato bag.');
INSERT OR IGNORE INTO raw_input VALUES('posh beige bags contain 2 drab silver bags, 2 dull purple bags, 4 dotted magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded magenta bags contain 4 bright beige bags, 3 pale purple bags, 2 posh plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped teal bags contain 2 light tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny beige bags contain 3 posh turquoise bags, 4 drab lavender bags, 3 dark magenta bags, 5 dotted teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull violet bags contain 2 dull teal bags, 4 shiny fuchsia bags, 2 bright coral bags, 1 pale bronze bag.');
INSERT OR IGNORE INTO raw_input VALUES('light fuchsia bags contain 2 pale crimson bags, 4 bright blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded tomato bags contain 4 bright fuchsia bags, 3 posh tan bags, 3 dark blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh tan bags contain 2 bright aqua bags, 1 mirrored purple bag, 2 clear lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim cyan bags contain 2 dim beige bags, 2 dotted orange bags, 4 muted orange bags, 3 light plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid chartreuse bags contain 2 light orange bags, 5 dim fuchsia bags, 2 mirrored gray bags, 4 mirrored tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab silver bags contain 2 dim blue bags, 2 light lavender bags, 3 wavy tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull lavender bags contain 5 dull magenta bags, 3 dotted tomato bags, 5 faded gold bags, 2 pale tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab cyan bags contain 3 pale plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded green bags contain 3 light violet bags, 3 pale maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid red bags contain 1 clear olive bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab tomato bags contain 3 faded yellow bags, 5 striped fuchsia bags, 4 light gold bags, 1 faded bronze bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted black bags contain 5 vibrant aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped fuchsia bags contain 1 muted olive bag, 2 pale black bags, 2 light teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('light coral bags contain 4 striped fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh coral bags contain 5 faded tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded blue bags contain 3 dim chartreuse bags, 5 bright coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid green bags contain 5 striped plum bags, 3 faded turquoise bags, 5 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark cyan bags contain 2 bright turquoise bags, 4 plaid plum bags, 1 shiny green bag.');
INSERT OR IGNORE INTO raw_input VALUES('posh yellow bags contain 3 pale yellow bags, 3 muted purple bags, 1 light magenta bag, 4 light aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored turquoise bags contain 2 vibrant gray bags, 4 drab orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded tan bags contain 2 drab orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh plum bags contain 1 light gold bag, 4 posh orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted chartreuse bags contain 2 shiny violet bags, 1 pale plum bag, 1 dim crimson bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted white bags contain 5 pale brown bags, 5 clear lavender bags, 1 faded bronze bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale plum bags contain 5 dotted violet bags, 5 mirrored gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid tomato bags contain 4 vibrant coral bags, 4 dim aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant cyan bags contain 1 shiny lavender bag, 3 faded orange bags, 2 striped fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny silver bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant aqua bags contain 3 plaid orange bags, 2 light blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted purple bags contain 4 faded gold bags, 4 clear green bags, 1 mirrored gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('light chartreuse bags contain 1 bright black bag.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored aqua bags contain 4 drab salmon bags, 2 striped red bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded lime bags contain 4 faded gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear indigo bags contain 3 dim tomato bags, 1 light purple bag, 3 dark salmon bags, 5 posh teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy violet bags contain 2 posh turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('light blue bags contain 1 vibrant turquoise bag, 5 vibrant salmon bags, 2 light gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear blue bags contain 4 bright aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright coral bags contain 1 light lavender bag.');
INSERT OR IGNORE INTO raw_input VALUES('light green bags contain 2 pale silver bags, 3 light lavender bags, 2 posh silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark lime bags contain 4 muted crimson bags, 3 mirrored teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored red bags contain 5 dotted cyan bags, 2 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab purple bags contain 2 bright salmon bags, 1 striped plum bag.');
INSERT OR IGNORE INTO raw_input VALUES('posh red bags contain 5 drab salmon bags, 5 posh gold bags, 1 vibrant crimson bag, 5 vibrant yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear red bags contain 5 muted white bags, 3 mirrored gold bags, 1 plaid blue bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab fuchsia bags contain 4 drab salmon bags, 5 dark red bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark tomato bags contain 4 plaid orange bags, 1 dull magenta bag, 5 striped aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted crimson bags contain 2 vibrant gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted bronze bags contain 4 plaid beige bags, 3 striped red bags, 3 muted olive bags, 5 dotted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded bronze bags contain 5 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped maroon bags contain 5 bright gold bags, 2 clear brown bags, 3 vibrant cyan bags, 4 dotted coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('light cyan bags contain 5 mirrored turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored cyan bags contain 1 muted olive bag, 2 drab salmon bags, 5 muted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid lavender bags contain 1 light teal bag, 4 dotted indigo bags, 5 faded green bags, 1 light aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('light gray bags contain 5 mirrored red bags, 1 plaid magenta bag, 1 pale black bag, 3 clear blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy indigo bags contain 3 dim teal bags, 2 shiny gold bags, 4 dim gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright tomato bags contain 1 mirrored gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale blue bags contain 3 vibrant teal bags, 3 muted magenta bags, 1 mirrored salmon bag, 4 striped cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh bronze bags contain 1 bright tomato bag, 2 bright teal bags, 1 dark magenta bag, 1 mirrored silver bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted violet bags contain 4 shiny silver bags, 5 drab green bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark black bags contain 3 vibrant gray bags, 1 faded bronze bag, 2 faded gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted gray bags contain 3 wavy orange bags, 2 mirrored tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny chartreuse bags contain 5 bright turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull red bags contain 5 wavy olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark orange bags contain 3 plaid bronze bags, 1 dark blue bag, 1 dim gray bag, 4 pale chartreuse bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy yellow bags contain 3 plaid indigo bags, 3 dull purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab salmon bags contain 3 light blue bags, 2 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab beige bags contain 2 pale turquoise bags, 5 light gold bags, 4 bright aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull olive bags contain 2 pale chartreuse bags, 3 dull cyan bags, 5 mirrored teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy crimson bags contain 4 faded orange bags, 5 bright gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted maroon bags contain 1 muted salmon bag.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored white bags contain 2 light bronze bags, 3 clear brown bags, 2 dark turquoise bags, 2 dim indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy gray bags contain 1 light lime bag, 1 faded turquoise bag, 4 muted teal bags, 2 dim crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny gray bags contain 4 dull cyan bags, 2 clear red bags, 5 dark magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull orange bags contain 1 dull indigo bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab maroon bags contain 5 light red bags, 1 pale orange bag.');
INSERT OR IGNORE INTO raw_input VALUES('shiny blue bags contain 3 striped magenta bags, 2 light violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale lavender bags contain 5 faded tan bags, 4 light tan bags, 1 striped coral bag.');
INSERT OR IGNORE INTO raw_input VALUES('wavy magenta bags contain 4 dull crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright maroon bags contain 5 shiny salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright gray bags contain 5 light blue bags, 3 faded gold bags, 5 dull tomato bags, 2 faded silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted aqua bags contain 4 mirrored purple bags, 5 light blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull plum bags contain 3 shiny purple bags, 3 dim indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('light indigo bags contain 2 mirrored bronze bags, 4 wavy lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny crimson bags contain 4 dull violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull lime bags contain 1 mirrored gray bag, 1 shiny brown bag, 5 dark fuchsia bags, 4 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab chartreuse bags contain 4 muted purple bags, 5 bright magenta bags, 4 dark salmon bags, 3 pale indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded aqua bags contain 1 dotted white bag, 1 drab olive bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted magenta bags contain 5 wavy tomato bags, 2 striped fuchsia bags, 3 dull blue bags, 3 pale yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright tan bags contain 1 dark blue bag, 5 vibrant turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted fuchsia bags contain 2 dull silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted plum bags contain 1 wavy coral bag, 3 vibrant teal bags, 2 dim bronze bags, 1 pale salmon bag.');
INSERT OR IGNORE INTO raw_input VALUES('clear silver bags contain 1 faded orange bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded beige bags contain 4 mirrored orange bags, 4 plaid white bags, 1 muted violet bag.');
INSERT OR IGNORE INTO raw_input VALUES('bright red bags contain 5 posh fuchsia bags, 4 striped cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded yellow bags contain 3 vibrant turquoise bags, 5 bright teal bags, 3 pale white bags.');
INSERT OR IGNORE INTO raw_input VALUES('light red bags contain 4 shiny bronze bags, 2 mirrored gray bags, 5 dark violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim orange bags contain 3 dull brown bags, 3 dim turquoise bags, 3 bright chartreuse bags, 1 dark red bag.');
INSERT OR IGNORE INTO raw_input VALUES('posh salmon bags contain 2 faded lavender bags, 1 faded brown bag.');
INSERT OR IGNORE INTO raw_input VALUES('shiny white bags contain 5 clear crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny black bags contain 2 vibrant coral bags, 2 wavy indigo bags, 4 shiny gold bags, 4 mirrored tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale turquoise bags contain 2 dim olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant maroon bags contain 3 striped turquoise bags, 3 clear magenta bags, 1 dark fuchsia bag, 5 dark brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy coral bags contain 5 vibrant aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped green bags contain 3 light magenta bags, 4 clear magenta bags, 1 light turquoise bag.');
INSERT OR IGNORE INTO raw_input VALUES('dark gray bags contain 3 dark aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny bronze bags contain 5 vibrant turquoise bags, 1 faded gold bag, 5 dark fuchsia bags, 3 dotted cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull teal bags contain 3 clear cyan bags, 1 bright chartreuse bag, 2 dull gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark fuchsia bags contain 1 dull silver bag, 3 dim gold bags, 1 clear teal bag, 5 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh blue bags contain 4 drab teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab violet bags contain 3 dim lavender bags, 1 vibrant aqua bag, 4 muted gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy white bags contain 1 dark coral bag, 2 dotted gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted coral bags contain 1 vibrant teal bag, 5 dim tan bags, 4 light bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark silver bags contain 5 shiny purple bags, 2 posh indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale bronze bags contain 3 striped white bags, 1 pale aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted turquoise bags contain 2 dark bronze bags, 2 mirrored turquoise bags, 2 clear yellow bags, 2 posh orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted turquoise bags contain 1 faded blue bag, 1 dotted crimson bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded indigo bags contain 5 mirrored blue bags, 3 striped crimson bags, 3 light green bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright salmon bags contain 4 dim gold bags, 1 mirrored red bag.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored violet bags contain 5 dull tomato bags, 4 shiny maroon bags, 3 dark green bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid blue bags contain 1 bright aqua bag, 1 light gold bag, 4 mirrored turquoise bags, 1 dim gold bag.');
INSERT OR IGNORE INTO raw_input VALUES('wavy green bags contain 5 light white bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant gray bags contain 3 drab green bags, 5 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant red bags contain 3 shiny lavender bags, 5 light indigo bags, 3 dotted chartreuse bags, 3 bright aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted tomato bags contain 4 clear green bags, 3 vibrant gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored teal bags contain 4 posh orange bags, 3 shiny gold bags, 4 clear magenta bags, 4 dull crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted brown bags contain 5 dotted cyan bags, 1 pale turquoise bag, 2 posh olive bags, 2 light black bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy beige bags contain 1 dull tomato bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale white bags contain 4 drab orange bags, 3 dim tomato bags, 2 clear lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored purple bags contain 4 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid orange bags contain 1 faded bronze bag, 3 dotted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny lime bags contain 4 light green bags, 4 dim orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant tomato bags contain 4 pale plum bags, 2 pale maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright turquoise bags contain 2 dim gold bags, 5 pale maroon bags, 5 dull tomato bags, 1 mirrored beige bag.');
INSERT OR IGNORE INTO raw_input VALUES('bright lime bags contain 4 clear beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny tan bags contain 4 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored green bags contain 5 wavy magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh green bags contain 1 plaid aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant olive bags contain 4 striped plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant crimson bags contain 1 dim lavender bag, 5 faded bronze bags, 1 drab green bag, 3 plaid magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright gold bags contain 5 dark purple bags, 4 dark teal bags, 2 dark white bags, 4 striped white bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy chartreuse bags contain 1 wavy gray bag, 2 faded olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted black bags contain 4 shiny gold bags, 4 vibrant turquoise bags, 5 shiny magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale salmon bags contain 4 dotted gray bags, 4 dim turquoise bags, 2 clear silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab coral bags contain 3 shiny lime bags, 4 light green bags, 4 vibrant olive bags, 5 bright chartreuse bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale green bags contain 2 clear green bags, 5 shiny green bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped tan bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale silver bags contain 4 shiny silver bags, 5 clear gold bags, 1 dim lime bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale olive bags contain 3 muted fuchsia bags, 3 shiny tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright cyan bags contain 4 clear lavender bags, 4 drab green bags, 1 striped tan bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab teal bags contain 3 drab tan bags, 1 shiny bronze bag, 1 light green bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted salmon bags contain 2 plaid fuchsia bags, 1 shiny purple bag, 4 wavy silver bags, 2 dark salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny tomato bags contain 1 wavy turquoise bag, 2 pale gray bags, 5 bright red bags, 1 dotted aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('clear cyan bags contain 3 posh tan bags, 4 dim green bags, 3 plaid blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim lavender bags contain 5 light coral bags, 5 dull indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('light gold bags contain 4 faded gold bags, 3 pale plum bags, 2 clear lavender bags, 1 dim lime bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted tan bags contain 2 plaid gray bags, 3 muted fuchsia bags, 4 posh gray bags, 2 mirrored brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped olive bags contain 2 dim lime bags, 3 dull tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim green bags contain 4 light blue bags, 5 dark turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale tan bags contain 1 light indigo bag, 5 shiny chartreuse bags, 5 dim purple bags, 2 faded gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright orange bags contain 5 striped white bags, 2 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded orange bags contain 1 plaid magenta bag, 2 striped olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh olive bags contain 2 bright gold bags, 2 dull tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted silver bags contain 1 wavy crimson bag, 5 light green bags, 5 striped plum bags, 5 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy turquoise bags contain 5 striped purple bags, 3 shiny blue bags, 3 dotted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid gray bags contain 1 posh teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('dark magenta bags contain 3 striped olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab magenta bags contain 2 drab plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright beige bags contain 1 clear teal bag, 2 dotted violet bags, 5 posh lavender bags, 5 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark tan bags contain 2 posh indigo bags, 3 light green bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted blue bags contain 1 shiny fuchsia bag, 5 dark white bags, 2 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy fuchsia bags contain 2 dotted salmon bags, 3 striped gray bags, 1 clear silver bag, 3 shiny maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('light plum bags contain 2 posh chartreuse bags, 3 pale orange bags, 1 striped violet bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull indigo bags contain 3 dim coral bags, 5 bright orange bags, 5 shiny purple bags, 1 posh fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('light olive bags contain 2 clear plum bags, 2 dotted indigo bags, 1 vibrant maroon bag, 2 drab crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale magenta bags contain 4 plaid bronze bags, 4 muted aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded white bags contain 1 shiny salmon bag, 4 drab fuchsia bags, 3 striped cyan bags, 5 light bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright bronze bags contain 2 bright gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim chartreuse bags contain 5 wavy beige bags, 1 mirrored silver bag, 5 pale brown bags, 4 pale silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright black bags contain 1 light teal bag, 3 shiny bronze bags, 5 faded beige bags, 3 striped magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear coral bags contain 1 pale gold bag, 3 dim tomato bags, 3 dark violet bags, 2 dim purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark indigo bags contain 1 vibrant turquoise bag.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored tomato bags contain 1 drab yellow bag, 5 muted olive bags, 3 wavy black bags, 3 dotted lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped plum bags contain 3 faded bronze bags, 1 vibrant gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('bright purple bags contain 3 muted gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted gold bags contain 4 light indigo bags, 4 bright tomato bags, 3 striped tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded lavender bags contain 5 wavy indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped beige bags contain 2 striped fuchsia bags, 5 mirrored magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded fuchsia bags contain 1 mirrored fuchsia bag, 1 posh aqua bag, 4 clear coral bags, 3 mirrored magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright aqua bags contain 1 muted white bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale crimson bags contain 3 light purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy aqua bags contain 2 shiny purple bags, 1 posh orange bag, 1 dark red bag, 3 drab lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh violet bags contain 4 wavy teal bags, 4 dull chartreuse bags, 4 wavy salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('light salmon bags contain 4 mirrored crimson bags, 1 striped red bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim beige bags contain 4 dim turquoise bags, 4 drab fuchsia bags, 2 vibrant tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear yellow bags contain 5 mirrored orange bags, 3 dark teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale fuchsia bags contain 1 mirrored bronze bag, 3 posh lavender bags, 2 shiny lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh gold bags contain 1 bright teal bag, 3 light green bags, 4 muted blue bags, 4 drab green bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped aqua bags contain 4 wavy beige bags, 1 dotted indigo bag.');
INSERT OR IGNORE INTO raw_input VALUES('plaid indigo bags contain 5 striped green bags, 5 light purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted tomato bags contain 2 posh tomato bags, 1 pale coral bag, 3 muted white bags, 5 dim orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored silver bags contain 1 faded silver bag, 2 dull bronze bags, 2 dim red bags, 5 posh brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant silver bags contain 5 striped olive bags, 2 clear olive bags, 5 bright coral bags, 1 plaid fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull chartreuse bags contain 1 muted aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted green bags contain 4 vibrant white bags, 1 dim teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('plaid cyan bags contain 4 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark crimson bags contain 5 shiny purple bags, 1 dotted brown bag, 4 clear coral bags, 1 striped lavender bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted orange bags contain 2 drab cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark salmon bags contain 1 pale black bag, 2 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped salmon bags contain 3 dim aqua bags, 1 clear purple bag, 3 muted crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant lavender bags contain 3 posh orange bags, 4 posh indigo bags, 3 plaid magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny purple bags contain 2 dotted violet bags, 5 striped tan bags, 2 pale plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid lime bags contain 4 wavy salmon bags, 2 light magenta bags, 5 striped crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab blue bags contain 3 dull orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored salmon bags contain 4 pale black bags, 3 posh tan bags, 4 vibrant violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted red bags contain 3 light coral bags, 5 muted teal bags, 1 dark blue bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted olive bags contain 2 clear lime bags, 3 faded bronze bags, 5 shiny silver bags, 4 clear magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny cyan bags contain 3 light green bags, 2 dull maroon bags, 1 pale aqua bag, 5 mirrored gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid teal bags contain 1 dull teal bag, 5 faded white bags, 4 vibrant purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull silver bags contain 2 bright cyan bags, 3 clear green bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim silver bags contain 5 dim orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark red bags contain 1 shiny fuchsia bag, 5 drab orange bags, 1 dull lime bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull gray bags contain 5 posh tan bags, 5 mirrored violet bags, 5 clear gold bags, 3 striped olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored olive bags contain 3 mirrored yellow bags, 4 striped lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull gold bags contain 3 faded beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim olive bags contain 5 dull maroon bags, 3 dull beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark blue bags contain 4 dim lime bags, 4 muted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh silver bags contain 3 posh lavender bags, 2 bright beige bags, 5 dim coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted indigo bags contain 2 pale gray bags, 4 light violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid turquoise bags contain 1 pale purple bag, 1 pale brown bag.');
INSERT OR IGNORE INTO raw_input VALUES('striped purple bags contain 2 shiny brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull turquoise bags contain 3 dull teal bags, 3 dark coral bags, 4 dull silver bags, 4 faded violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid olive bags contain 3 dim green bags, 1 wavy chartreuse bag, 5 pale crimson bags, 5 mirrored green bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear tomato bags contain 1 posh gray bag, 4 clear teal bags, 2 drab indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull tan bags contain 4 vibrant brown bags, 3 drab orange bags, 5 bright maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark gold bags contain 3 light teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded olive bags contain 4 clear gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh fuchsia bags contain 2 dull brown bags, 1 dull silver bag, 3 mirrored tan bags, 2 dim coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull purple bags contain 1 dim turquoise bag, 3 plaid coral bags, 5 striped lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright plum bags contain 3 pale green bags, 2 pale gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded violet bags contain 2 plaid white bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped lime bags contain 2 striped cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear lime bags contain 3 faded orange bags, 1 posh lavender bag, 3 dull lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab red bags contain 2 dim gold bags, 4 dotted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored orange bags contain 2 mirrored gold bags, 1 dull gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab white bags contain 1 vibrant silver bag, 4 bright cyan bags, 5 shiny red bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy red bags contain 4 plaid fuchsia bags, 2 pale maroon bags, 4 wavy indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale gray bags contain 2 dim gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored blue bags contain 4 dull purple bags, 4 dull bronze bags, 5 faded violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale aqua bags contain 2 shiny brown bags, 2 vibrant coral bags, 3 dark green bags, 5 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid violet bags contain 2 dim tomato bags, 5 dim teal bags, 4 drab salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny magenta bags contain 5 dull beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped magenta bags contain 2 drab olive bags, 3 dim chartreuse bags, 3 plaid beige bags, 5 mirrored crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded black bags contain 1 bright coral bag, 1 mirrored magenta bag, 1 pale coral bag, 4 posh bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid yellow bags contain 2 vibrant gray bags, 1 mirrored cyan bag, 2 light salmon bags, 1 light gold bag.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant brown bags contain 3 light tomato bags, 1 dark red bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded salmon bags contain 2 mirrored orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('light beige bags contain 1 vibrant violet bag, 4 dim green bags, 2 bright aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright magenta bags contain 4 mirrored brown bags, 4 faded white bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear violet bags contain 5 mirrored gold bags, 5 bright lavender bags, 5 dim red bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped blue bags contain 3 clear turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored fuchsia bags contain 2 shiny fuchsia bags, 5 faded bronze bags, 3 dull lime bags, 3 drab purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab lime bags contain 4 pale yellow bags, 3 drab salmon bags, 5 clear beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy maroon bags contain 3 drab cyan bags, 5 light turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped coral bags contain 4 dull magenta bags, 5 posh maroon bags, 3 shiny red bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy lime bags contain 1 plaid green bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim maroon bags contain 4 faded lime bags, 1 striped olive bag, 4 dull bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear orange bags contain 5 posh bronze bags, 4 striped tan bags, 4 mirrored bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant plum bags contain 1 bright white bag, 5 light aqua bags, 4 mirrored fuchsia bags, 2 vibrant purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab bronze bags contain 3 light gray bags, 2 faded orange bags, 4 pale black bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored brown bags contain 1 light blue bag, 2 posh olive bags, 5 vibrant magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored gray bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim aqua bags contain 3 bright tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear aqua bags contain 3 drab indigo bags, 4 light bronze bags, 5 drab teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull yellow bags contain 4 dim magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny indigo bags contain 4 wavy red bags, 3 dim salmon bags, 5 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped crimson bags contain 1 light green bag, 2 dull blue bags, 5 dotted olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored yellow bags contain 4 dull maroon bags, 4 mirrored aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab aqua bags contain 1 drab teal bag, 1 dull gold bag, 4 dim red bags, 3 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear green bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid bronze bags contain 2 vibrant olive bags, 5 wavy green bags, 4 muted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored black bags contain 2 striped red bags, 2 drab tomato bags, 4 shiny maroon bags, 1 striped gray bag.');
INSERT OR IGNORE INTO raw_input VALUES('muted purple bags contain 4 mirrored maroon bags, 2 dull white bags, 3 plaid salmon bags, 1 faded lime bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab brown bags contain 3 vibrant maroon bags, 5 posh indigo bags, 2 light silver bags, 5 bright black bags.');
INSERT OR IGNORE INTO raw_input VALUES('light yellow bags contain 2 posh olive bags, 4 light turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored indigo bags contain 5 pale maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab black bags contain 3 mirrored green bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny teal bags contain 2 dim plum bags, 4 dotted indigo bags, 1 mirrored lime bag, 2 light green bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped chartreuse bags contain 2 dim olive bags, 1 wavy teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab indigo bags contain 3 dull blue bags, 3 bright indigo bags, 1 dull purple bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded crimson bags contain 2 vibrant gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh white bags contain 2 shiny violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy purple bags contain 3 drab green bags, 5 muted purple bags, 1 dull teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted lime bags contain 2 drab teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted orange bags contain 2 bright salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh magenta bags contain 3 dotted silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped yellow bags contain 1 dull chartreuse bag, 3 dark maroon bags, 3 faded orange bags, 3 shiny salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted yellow bags contain 1 dim gold bag, 4 clear brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab orange bags contain 2 mirrored crimson bags, 2 clear lavender bags, 3 faded bronze bags, 4 posh lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull coral bags contain 5 dim teal bags, 1 light gold bag, 2 drab lime bags, 3 faded lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear gold bags contain 5 drab green bags, 4 dim coral bags, 3 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim purple bags contain 4 bright aqua bags, 5 posh lavender bags, 5 vibrant salmon bags, 3 pale black bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear salmon bags contain 1 vibrant orange bag, 1 faded orange bag, 5 dull tomato bags, 3 mirrored turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear brown bags contain 5 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded maroon bags contain 2 dotted blue bags, 4 plaid fuchsia bags, 5 light purple bags, 4 faded purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny red bags contain 5 mirrored crimson bags, 2 mirrored cyan bags, 2 dark bronze bags, 1 pale plum bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded red bags contain 5 dotted yellow bags, 2 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted gold bags contain 4 vibrant coral bags, 1 clear turquoise bag.');
INSERT OR IGNORE INTO raw_input VALUES('wavy olive bags contain 5 light violet bags, 5 bright white bags, 3 vibrant chartreuse bags, 1 mirrored silver bag.');
INSERT OR IGNORE INTO raw_input VALUES('dark brown bags contain 3 muted blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim salmon bags contain 1 dull silver bag, 5 vibrant purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark chartreuse bags contain 3 dull beige bags, 3 light tan bags, 3 vibrant cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear tan bags contain 2 vibrant coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear white bags contain 3 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim yellow bags contain 4 plaid coral bags, 1 posh tomato bag, 4 striped turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright indigo bags contain 4 dull magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid gold bags contain 2 dark violet bags, 3 shiny blue bags, 5 drab indigo bags, 3 shiny orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark aqua bags contain 3 faded indigo bags, 1 pale brown bag, 5 muted chartreuse bags.');
INSERT OR IGNORE INTO raw_input VALUES('light lime bags contain 5 muted teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark teal bags contain 1 dark olive bag, 1 drab lavender bag, 2 mirrored purple bags, 1 pale teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('faded turquoise bags contain 1 posh fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored plum bags contain 2 striped chartreuse bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear beige bags contain 1 plaid blue bag, 5 faded gold bags, 5 mirrored crimson bags, 3 drab lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted salmon bags contain 1 clear tan bag, 5 mirrored gold bags, 5 faded beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh lavender bags contain 2 mirrored gray bags, 3 clear green bags, 5 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright white bags contain 1 posh gold bag, 5 mirrored silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted cyan bags contain 5 mirrored gray bags, 2 dull silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim tomato bags contain 5 dull brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted brown bags contain 2 pale turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh cyan bags contain 5 dim coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted magenta bags contain 3 posh olive bags, 2 dark indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale purple bags contain 5 dotted cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant salmon bags contain 3 dim teal bags, 1 posh lavender bag, 2 pale purple bags, 4 plaid magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored gold bags contain 5 dark indigo bags, 4 mirrored indigo bags, 4 dotted cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped brown bags contain 5 posh tomato bags, 5 posh brown bags, 2 faded turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark bronze bags contain 5 bright chartreuse bags, 4 striped teal bags, 2 muted black bags, 2 muted olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('light silver bags contain 1 plaid cyan bag, 2 vibrant coral bags, 1 muted gray bag, 4 striped purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale violet bags contain 3 posh teal bags, 1 dull beige bag, 2 plaid beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear teal bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh lime bags contain 1 dark coral bag, 5 bright teal bags, 5 bright cyan bags, 3 posh fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('light crimson bags contain 4 dotted beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted lavender bags contain 1 light fuchsia bag, 2 shiny crimson bags, 2 drab purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid crimson bags contain 4 mirrored red bags, 1 posh chartreuse bag, 2 muted indigo bags, 1 plaid lavender bag.');
INSERT OR IGNORE INTO raw_input VALUES('light magenta bags contain 3 drab bronze bags, 1 dull olive bag.');
INSERT OR IGNORE INTO raw_input VALUES('bright yellow bags contain 4 plaid plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant bronze bags contain 5 dotted red bags, 4 wavy silver bags, 4 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright blue bags contain 1 clear white bag, 1 wavy aqua bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim turquoise bags contain 5 pale purple bags, 1 vibrant magenta bag, 1 vibrant turquoise bag, 3 shiny brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant chartreuse bags contain 4 muted blue bags, 3 pale indigo bags, 1 dark black bag, 1 bright tomato bag.');
INSERT OR IGNORE INTO raw_input VALUES('light tan bags contain 2 mirrored beige bags, 5 dull turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy salmon bags contain 5 dull crimson bags, 2 bright salmon bags, 3 muted gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored maroon bags contain 3 shiny brown bags, 1 shiny fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('pale teal bags contain 1 striped purple bag, 3 drab orange bags, 1 dull silver bag, 1 dark fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('striped tomato bags contain 2 dim orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('light teal bags contain 1 dull tomato bag, 5 clear gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark olive bags contain 5 striped white bags, 5 dim red bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy orange bags contain 1 clear green bag.');
INSERT OR IGNORE INTO raw_input VALUES('plaid brown bags contain 5 dull olive bags, 3 wavy gray bags, 1 dotted violet bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim white bags contain 3 clear tan bags, 1 clear yellow bag, 1 pale crimson bag.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant black bags contain 2 dim fuchsia bags, 1 dull lime bag, 3 faded magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted aqua bags contain 4 posh tomato bags, 4 pale plum bags, 1 posh coral bag.');
INSERT OR IGNORE INTO raw_input VALUES('striped gold bags contain 5 dim orange bags, 2 drab green bags, 2 striped red bags, 3 muted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim gold bags contain 3 posh lavender bags, 4 drab green bags, 4 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored bronze bags contain 4 pale aqua bags, 4 faded orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored beige bags contain 3 wavy gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted teal bags contain 3 dull indigo bags, 4 mirrored gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark maroon bags contain 4 dark turquoise bags, 5 mirrored silver bags, 4 wavy bronze bags, 4 clear turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy teal bags contain 3 plaid fuchsia bags, 2 drab orange bags, 3 vibrant teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted lime bags contain 5 bright blue bags, 3 light salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid plum bags contain 2 wavy gold bags, 2 pale aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped indigo bags contain 5 faded black bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear lavender bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull tomato bags contain 3 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny yellow bags contain 5 faded coral bags, 2 striped violet bags, 5 clear orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('light lavender bags contain 5 dull maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale chartreuse bags contain 4 clear green bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh turquoise bags contain 2 striped olive bags, 5 bright chartreuse bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright lavender bags contain 4 dark white bags, 5 wavy coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny lavender bags contain 2 wavy lime bags, 2 wavy bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('light black bags contain 4 pale black bags, 4 pale purple bags, 5 drab lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid maroon bags contain 1 clear teal bag, 3 clear lavender bags, 1 dim chartreuse bag, 2 vibrant teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped cyan bags contain 4 posh fuchsia bags, 4 faded violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped lavender bags contain 4 pale yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh purple bags contain 4 light tomato bags, 4 muted crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim crimson bags contain 5 wavy aqua bags, 2 pale maroon bags, 4 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted fuchsia bags contain 2 striped gray bags, 4 posh gray bags, 5 clear white bags, 5 dotted orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab turquoise bags contain 2 bright indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant purple bags contain 3 mirrored bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright olive bags contain 4 light bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny plum bags contain 1 muted indigo bag, 2 light lime bags, 4 clear coral bags, 2 dim lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted beige bags contain 1 plaid plum bag, 3 dark coral bags, 2 wavy indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped black bags contain 3 muted gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny orange bags contain 2 faded blue bags, 3 shiny green bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny coral bags contain 1 posh orange bag, 4 striped red bags, 4 muted yellow bags, 2 dull lavender bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant yellow bags contain 2 dull fuchsia bags, 2 pale coral bags, 1 muted magenta bag, 3 drab turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny gold bags contain 5 mirrored crimson bags, 5 mirrored tan bags, 5 drab green bags, 5 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright violet bags contain 2 vibrant white bags, 1 clear green bag, 3 faded yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored tan bags contain 2 dark black bags, 4 clear green bags, 2 bright cyan bags, 4 faded bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh indigo bags contain 4 pale plum bags, 1 dark brown bag, 4 dull crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale indigo bags contain 3 posh plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab tan bags contain 1 light gray bag, 5 drab orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted green bags contain 1 dotted violet bag, 4 dotted cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('light turquoise bags contain 2 posh brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted blue bags contain 1 posh purple bag, 4 plaid gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid silver bags contain 3 wavy maroon bags, 5 clear black bags, 5 shiny indigo bags, 2 striped gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim plum bags contain 3 dotted fuchsia bags, 5 clear yellow bags, 4 striped red bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted chartreuse bags contain 1 clear yellow bag, 1 dim red bag, 4 dim turquoise bags, 1 mirrored orange bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim blue bags contain 3 bright turquoise bags, 3 light blue bags, 2 wavy red bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded gold bags contain 3 mirrored gray bags, 4 dotted cyan bags, 5 mirrored red bags, 4 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull fuchsia bags contain 1 plaid cyan bag, 3 shiny purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted coral bags contain 5 muted aqua bags, 1 dark orange bag, 3 bright black bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped bronze bags contain 5 mirrored purple bags, 2 wavy aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded silver bags contain 1 bright salmon bag, 1 striped olive bag, 3 vibrant turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant white bags contain 5 muted crimson bags, 4 bright orange bags, 2 dark brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny fuchsia bags contain 2 dull silver bags, 1 wavy indigo bag, 5 shiny gold bags, 2 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab crimson bags contain 3 mirrored purple bags, 2 clear magenta bags, 3 light indigo bags, 5 clear brown bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh aqua bags contain 2 dark brown bags, 2 shiny white bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale tomato bags contain 5 posh gray bags, 1 wavy silver bag, 5 drab crimson bags, 2 dotted aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy bronze bags contain 5 plaid coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull white bags contain 4 shiny magenta bags, 1 clear olive bag, 5 posh silver bags, 4 dark blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny aqua bags contain 5 drab green bags, 4 dark maroon bags, 3 striped turquoise bags, 4 pale white bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy brown bags contain 1 faded gold bag, 2 bright aqua bags, 5 dotted tan bags, 3 vibrant crimson bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear black bags contain 1 dull orange bag, 5 posh fuchsia bags, 2 mirrored cyan bags, 5 shiny gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh tomato bags contain 4 pale plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant fuchsia bags contain 4 drab olive bags, 1 drab bronze bag, 4 dull blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored lavender bags contain 2 faded cyan bags, 3 mirrored bronze bags, 2 faded tan bags, 5 clear cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored lime bags contain 4 dull gray bags, 4 plaid beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded chartreuse bags contain 3 light coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim brown bags contain 3 pale yellow bags, 4 striped lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale gold bags contain 3 striped plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('mirrored chartreuse bags contain 2 striped salmon bags, 4 shiny teal bags, 4 wavy gold bags, 4 light magenta bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid white bags contain 5 faded orange bags, 4 dull tomato bags, 1 vibrant olive bag.');
INSERT OR IGNORE INTO raw_input VALUES('clear crimson bags contain 5 posh maroon bags, 5 muted white bags, 2 dim fuchsia bags, 4 pale maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy tomato bags contain 3 dim tan bags, 4 dim orange bags, 1 mirrored tan bag, 4 posh indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim coral bags contain no other bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid magenta bags contain 2 clear gold bags, 1 posh orange bag.');
INSERT OR IGNORE INTO raw_input VALUES('wavy gold bags contain 1 plaid blue bag, 3 pale purple bags, 3 pale yellow bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy blue bags contain 2 light white bags, 5 pale magenta bags, 1 plaid lime bag, 5 faded cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale yellow bags contain 2 vibrant gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear chartreuse bags contain 1 light gray bag, 1 dark tomato bag.');
INSERT OR IGNORE INTO raw_input VALUES('drab lavender bags contain 4 vibrant salmon bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark turquoise bags contain 5 pale plum bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant tan bags contain 5 plaid aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant green bags contain 4 vibrant red bags, 3 vibrant tomato bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid aqua bags contain 5 wavy silver bags, 5 faded silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale brown bags contain 1 dark fuchsia bag, 3 drab green bags, 5 bright cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab olive bags contain 1 dull maroon bag, 4 dark maroon bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy cyan bags contain 2 muted blue bags, 4 clear beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted white bags contain 5 dull orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny green bags contain 2 vibrant gray bags, 3 vibrant tomato bags, 2 dark violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright fuchsia bags contain 2 vibrant chartreuse bags, 2 dim orange bags, 4 clear orange bags, 5 posh fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear purple bags contain 2 dim gray bags, 1 shiny tan bag.');
INSERT OR IGNORE INTO raw_input VALUES('dotted lavender bags contain 3 posh gray bags, 4 dull beige bags, 5 plaid beige bags, 1 dull teal bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull salmon bags contain 2 muted magenta bags, 4 muted purple bags, 2 light teal bags, 4 vibrant cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark green bags contain 3 clear lavender bags, 5 shiny silver bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull maroon bags contain 2 dark fuchsia bags, 3 mirrored red bags, 3 mirrored gray bags, 5 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear bronze bags contain 2 dull turquoise bags, 4 dim olive bags, 3 wavy violet bags, 5 dotted bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted silver bags contain 1 clear green bag, 4 shiny tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark lavender bags contain 5 dim gray bags, 4 dark teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('light violet bags contain 2 light blue bags, 4 clear lavender bags, 4 dim teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant violet bags contain 4 posh plum bags, 5 dark fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh teal bags contain 2 pale indigo bags, 5 plaid fuchsia bags, 3 muted gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('posh crimson bags contain 5 bright gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark yellow bags contain 4 muted gold bags, 2 dull aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab gold bags contain 4 dark maroon bags, 1 dim turquoise bag, 4 mirrored cyan bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted tan bags contain 5 plaid turquoise bags, 2 shiny aqua bags.');
INSERT OR IGNORE INTO raw_input VALUES('vibrant indigo bags contain 1 faded plum bag, 5 dark purple bags, 4 drab maroon bags, 3 dull teal bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted olive bags contain 3 dull bronze bags, 3 drab salmon bags, 1 plaid magenta bag, 3 mirrored purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid purple bags contain 1 plaid turquoise bag, 1 muted olive bag, 1 shiny crimson bag.');
INSERT OR IGNORE INTO raw_input VALUES('dim lime bags contain 5 mirrored gray bags, 3 plaid magenta bags, 5 dark fuchsia bags, 2 bright beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('muted violet bags contain 3 bright aqua bags, 2 pale brown bags, 3 dark fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark beige bags contain 3 vibrant fuchsia bags, 2 shiny white bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim gray bags contain 3 mirrored violet bags, 1 plaid orange bag, 4 vibrant olive bags, 5 pale white bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale cyan bags contain 4 dark red bags, 2 mirrored beige bags, 5 shiny purple bags, 3 dark fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim indigo bags contain 2 faded blue bags, 5 muted bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny brown bags contain 4 vibrant salmon bags, 3 drab orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull black bags contain 5 shiny cyan bags, 5 dark purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('light white bags contain 2 mirrored beige bags, 2 faded turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim fuchsia bags contain 4 drab salmon bags, 5 striped gray bags, 2 light gray bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped gray bags contain 5 plaid white bags, 5 mirrored purple bags, 2 vibrant aqua bags, 4 muted indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy lavender bags contain 3 dotted cyan bags, 3 bright chartreuse bags, 5 plaid black bags, 3 dotted gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull blue bags contain 2 vibrant olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark violet bags contain 4 muted white bags, 4 dim lime bags.');
INSERT OR IGNORE INTO raw_input VALUES('shiny maroon bags contain 3 dotted violet bags, 5 shiny brown bags, 2 light blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('drab yellow bags contain 2 shiny fuchsia bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear fuchsia bags contain 5 wavy gray bags, 4 wavy white bags, 4 drab gray bags, 4 bright indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid coral bags contain 3 dull lime bags, 2 vibrant olive bags, 4 shiny gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull beige bags contain 4 dull blue bags, 2 pale black bags, 5 dim coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid salmon bags contain 1 bright coral bag, 2 bright tomato bags, 4 dim tan bags, 4 shiny purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('dim bronze bags contain 4 posh teal bags, 1 pale salmon bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull magenta bags contain 3 dull lime bags, 2 light gold bags, 2 striped purple bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid fuchsia bags contain 5 dim lime bags, 5 bright cyan bags, 2 faded silver bags, 1 posh fuchsia bag.');
INSERT OR IGNORE INTO raw_input VALUES('dark plum bags contain 2 plaid green bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped silver bags contain 5 clear silver bags, 2 dotted orange bags, 5 striped fuchsia bags, 4 posh bronze bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright green bags contain 4 bright white bags, 4 mirrored lavender bags, 2 shiny blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy plum bags contain 4 light turquoise bags, 4 shiny violet bags, 5 dim blue bags.');
INSERT OR IGNORE INTO raw_input VALUES('bright chartreuse bags contain 5 dim gold bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted crimson bags contain 4 wavy beige bags.');
INSERT OR IGNORE INTO raw_input VALUES('dull bronze bags contain 2 muted white bags, 2 faded orange bags, 1 plaid blue bag.');
INSERT OR IGNORE INTO raw_input VALUES('dull crimson bags contain 5 pale black bags, 5 dim lime bags, 5 clear lavender bags, 4 faded orange bags.');
INSERT OR IGNORE INTO raw_input VALUES('striped red bags contain 3 shiny maroon bags, 5 muted yellow bags, 2 faded lavender bags, 2 dark olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear magenta bags contain 4 dark coral bags.');
INSERT OR IGNORE INTO raw_input VALUES('plaid beige bags contain 4 vibrant purple bags, 5 drab salmon bags, 2 clear white bags, 5 dull olive bags.');
INSERT OR IGNORE INTO raw_input VALUES('dotted bronze bags contain 5 dull tomato bags, 5 clear lime bags, 2 clear gold bags, 5 mirrored indigo bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale black bags contain 3 faded bronze bags, 3 dotted violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('faded purple bags contain 1 light fuchsia bag, 4 dull violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('clear plum bags contain 2 vibrant gray bags, 4 striped tan bags.');
INSERT OR IGNORE INTO raw_input VALUES('wavy black bags contain 5 mirrored turquoise bags.');
INSERT OR IGNORE INTO raw_input VALUES('dark coral bags contain 5 faded violet bags.');
INSERT OR IGNORE INTO raw_input VALUES('pale orange bags contain 3 mirrored red bags, 4 clear olive bags.');

WITH RECURSIVE parsed_lines AS (
    SELECT
        SUBSTR(value, 1, INSTR(value, ' ') -1  + INSTR(SUBSTR(value, INSTR(value, ' ') + 1), ' ')) outer_bag,
        REPLACE(SUBSTR(value, INSTR(value, 'contain') + 8), '.', ',') remaining
    FROM raw_input
),
bag_rules_raw (outer_bag, value, inner_bag, rest) AS (
    SELECT outer_bag, 0, "", remaining FROM parsed_lines
    UNION ALL
    SELECT outer_bag,
        CAST(SUBSTR(rest, 1, 1) AS INTEGER),
        SUBSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), 1,
            INSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), ' ') +
            INSTR(SUBSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), INSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), ' ') + 1), ' ') -1
        ),
    SUBSTR(rest, INSTR(rest, ',') + 2)
    FROM bag_rules_raw

    WHERE rest <> ""
),
can_contain(bag_type) AS (
    SELECT 'shiny gold'
    UNION
    SELECT bag_rules_raw.outer_bag
    FROM can_contain
    INNER JOIN bag_rules_raw ON bag_rules_raw.inner_bag == can_contain.bag_type
    WHERE bag_rules_raw.value != 0
)

SELECT COUNT(*) FROM can_contain
WHERE bag_type != 'shiny gold';


WITH RECURSIVE parsed_lines AS (
    SELECT
        SUBSTR(value, 1, INSTR(value, ' ') -1  + INSTR(SUBSTR(value, INSTR(value, ' ') + 1), ' ')) outer_bag,
        REPLACE(SUBSTR(value, INSTR(value, 'contain') + 8), '.', ',') remaining
    FROM raw_input
),
bag_rules_raw (outer_bag, value, inner_bag, rest) AS (
    SELECT outer_bag, 0, "", remaining FROM parsed_lines
    UNION ALL
    SELECT outer_bag,
        CAST(SUBSTR(rest, 1, 1) AS INTEGER),
        SUBSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), 1,
            INSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), ' ') +
            INSTR(SUBSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), INSTR(SUBSTR(rest, INSTR(rest, ' ') + 1), ' ') + 1), ' ') -1
        ),
        SUBSTR(rest, INSTR(rest, ',') + 2)
    FROM bag_rules_raw

    WHERE rest <> ""
    AND NOT INSTR(rest, "no") > 0
)

INSERT INTO bag_rules
    SELECT outer_bag, value, inner_bag FROM bag_rules_raw
    WHERE value > 0 OR INSTR(rest, "no") > 0;

INSERT INTO bag_contents
	SELECT outer_bag, 0 FROM bag_rules
	WHERE value = 0;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

INSERT INTO bag_contents
	SELECT bag, SUM(amount) FROM (
		SELECT bag_rules.outer_bag bag,
			bag_rules.value + bag_rules.value * bag_contents.value amount
		FROM bag_rules
		JOIN bag_contents ON bag_contents.bag = bag_rules.inner_bag
		WHERE bag_rules.outer_bag IN (
			SELECT DISTINCT(bag_rules.outer_bag)
			FROM bag_rules
			WHERE bag_rules.outer_bag IN (
				SELECT DISTINCT(outer_bag) FROM bag_rules
				WHERE outer_bag NOT IN (
					SELECT DISTINCT(outer_bag) FROM bag_rules
						WHERE value != 0
						AND inner_bag NOT IN (select bag from bag_contents)
					UNION
					SELECT bag FROM bag_contents
				)
			)
		)
	)
	GROUP BY BAG;

SELECT * FROM bag_contents
WHERE bag == 'shiny gold';
