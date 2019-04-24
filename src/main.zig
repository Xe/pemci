const std = @import("std");

const olin = @import("./olin/olin.zig");
const Resource = olin.resource.Resource;
const rand_i64 = olin.random.int64;

export fn cwa_main() i32 {
    return main() catch 1;
}

fn main() !i32 {
    const poems = [][]const u8 {
        @bytesToSlice(u8, @embedFile("./poems/01a - Listening.md")),
        @bytesToSlice(u8, @embedFile("./poems/01b - Compassion.md")),
        @bytesToSlice(u8, @embedFile("./poems/02a - Temptress Vision.md")),
        @bytesToSlice(u8, @embedFile("./poems/02b - Language of Innocence.md")),
        @bytesToSlice(u8, @embedFile("./poems/03a - Half Mine.md")),
        @bytesToSlice(u8, @embedFile("./poems/03b - Bandages of the Beast.md")),
        @bytesToSlice(u8, @embedFile("./poems/04a - One Day.md")),
        @bytesToSlice(u8, @embedFile("./poems/04b - Missing.md")),
        @bytesToSlice(u8, @embedFile("./poems/05a - Life Carriers.md")),
        @bytesToSlice(u8, @embedFile("./poems/05b - Another.md")),
        @bytesToSlice(u8, @embedFile("./poems/06a - Of This Place.md")),
        @bytesToSlice(u8, @embedFile("./poems/06b - Imperishable.md")),
        @bytesToSlice(u8, @embedFile("./poems/07a - Union.md")),
        @bytesToSlice(u8, @embedFile("./poems/07b - Song of Whales.md")),
        @bytesToSlice(u8, @embedFile("./poems/08a - Another Mind Open.md")),
        @bytesToSlice(u8, @embedFile("./poems/08b - Longing.md")),
        @bytesToSlice(u8, @embedFile("./poems/09a - Of Luminous Things.md")),
        @bytesToSlice(u8, @embedFile("./poems/09b - Forever.md")),
        @bytesToSlice(u8, @embedFile("./poems/10a - Downstream.md")),
        @bytesToSlice(u8, @embedFile("./poems/10b - What is Found Here.md")),
        @bytesToSlice(u8, @embedFile("./poems/11a - Circle.md")),
        @bytesToSlice(u8, @embedFile("./poems/11b - Awake and Waiting.md")),
        @bytesToSlice(u8, @embedFile("./poems/12a - Wingmakers.md")),
        @bytesToSlice(u8, @embedFile("./poems/12b - Arrival.md")),
        @bytesToSlice(u8, @embedFile("./poems/13a - Nameless Boy.md")),
        @bytesToSlice(u8, @embedFile("./poems/13b - My Son.md")),
        @bytesToSlice(u8, @embedFile("./poems/14a - Empyrean.md")),
        @bytesToSlice(u8, @embedFile("./poems/14b - Separate Being.md")),
        @bytesToSlice(u8, @embedFile("./poems/15a - Secret Language.md")),
        @bytesToSlice(u8, @embedFile("./poems/15b - Wishing Light.md")),
        @bytesToSlice(u8, @embedFile("./poems/16a - Signals to Her Heart.md")),
        @bytesToSlice(u8, @embedFile("./poems/16b - Nothing Matters.md")),
        @bytesToSlice(u8, @embedFile("./poems/17a - Memories Unbound.md")),
        @bytesToSlice(u8, @embedFile("./poems/17b - Afterwards.md")),
        @bytesToSlice(u8, @embedFile("./poems/18a - Transparent Things.md")),
        @bytesToSlice(u8, @embedFile("./poems/18b - Final Dream.md")),
        @bytesToSlice(u8, @embedFile("./poems/19a - Easy to Find.md")),
        @bytesToSlice(u8, @embedFile("./poems/19b - Beckoning Places.md")),
        @bytesToSlice(u8, @embedFile("./poems/20a - Bullets and Light.md")),
        @bytesToSlice(u8, @embedFile("./poems/20b - Nature of Angels.md")),
        @bytesToSlice(u8, @embedFile("./poems/21a - Dream Wanderer.md")),
        @bytesToSlice(u8, @embedFile("./poems/21b - Forgiver.md")),
        @bytesToSlice(u8, @embedFile("./poems/22a - In the Kindness of Sleep.md")),
        @bytesToSlice(u8, @embedFile("./poems/22b - Warm Presence.md")),
        @bytesToSlice(u8, @embedFile("./poems/23a - Spiral.md")),
        @bytesToSlice(u8, @embedFile("./poems/23b - Souls Photograph.md")),
        @bytesToSlice(u8, @embedFile("./poems/23c - Folded Things.md")),
        @bytesToSlice(u8, @embedFile("./poems/24a - The Pure and Perfect.md")),
        @bytesToSlice(u8, @embedFile("./poems/24b - A Fire for You.md")),
        @bytesToSlice(u8, @embedFile("./poems/For You.md")),
        @bytesToSlice(u8, @embedFile("./poems/I AM WE ARE.md")),
        @bytesToSlice(u8, @embedFile("./poems/I Live Where You Live.md")),
        @bytesToSlice(u8, @embedFile("./poems/Love Wins.md")),
        @bytesToSlice(u8, @embedFile("./poems/Nectar.md")),
        @bytesToSlice(u8, @embedFile("./poems/Pilgrimage.md")),
        @bytesToSlice(u8, @embedFile("./poems/Unnamed1.md")),
    };

    const poemIndex = @mod(@intCast(usize, rand_i64()), poems.len);

    const fout = try Resource.stdout();
    const data = poems[poemIndex];
    var n = try fout.write(data.ptr, data.len);
    var newline = "\n";
    n = try fout.write(&newline, newline.len);
    fout.close();
    return 0;
}
