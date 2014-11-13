{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 9,
			"architecture" : "x86"
		}
,
		"rect" : [ 25.0, 69.0, 841.0, 614.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 40.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 328.0, 58.0, 60.0, 20.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-86",
					"linecount" : 2,
					"maxclass" : "o.expr.codebox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 50.0, 432.0, 669.0, 46.0 ],
					"text" : "map(lambda([addy, val], assign(addy, val)), /addresses/inputs/analogue, /inputs/analogue),\n/xosc/time = gettimetag()",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 50.0, 408.0, 50.0, 20.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-88",
					"linecount" : 17,
					"maxclass" : "o.compose",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.0, 88.0, 232.0, 241.0 ],
					"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 112, 47, 97, 100, 100, 114, 101, 115, 115, 101, 115, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 0, 0, 44, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 0, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 50, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 51, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 52, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 53, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 54, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 55, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 56, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 57, 0, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 48, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 49, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 50, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 51, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 52, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 53, 0, 47, 105, 110, 112, 117, 116, 115, 47, 97, 110, 97, 108, 111, 103, 117, 101, 47, 49, 54, 0 ],
					"saved_bundle_length" : 388,
					"text" : "/addresses/inputs/analogue : [\"/inputs/analogue/1\", \"/inputs/analogue/2\", \"/inputs/analogue/3\", \"/inputs/analogue/4\", \"/inputs/analogue/5\", \"/inputs/analogue/6\", \"/inputs/analogue/7\", \"/inputs/analogue/8\", \"/inputs/analogue/9\", \"/inputs/analogue/10\", \"/inputs/analogue/11\", \"/inputs/analogue/12\", \"/inputs/analogue/13\", \"/inputs/analogue/14\", \"/inputs/analogue/15\", \"/inputs/analogue/16\"]",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 50.0, 130.0, 159.0, 20.0 ],
					"text" : "o.if bound(/inputs/analogue)"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-106",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-107",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 514.812256, 25.0, 25.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
 ]
	}

}
