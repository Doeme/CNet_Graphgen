import std.stdio;
import std.range;
import std.algorithm;
import std.regex;
import std.typecons;
import std.conv;
import std.uni;

void main(string[] argv){
	string conn=argv[1];
	bool[string] registry;
	auto r=ctRegex!"group([0-9]+)";
	auto r2=ctRegex!"180.([0-9]+).0";
	auto ins=stdin
		.byLine;
	int prev=-1;
	foreach(l; ins){
		int nh;
		auto m=l.matchFirst(r);
		if(m.empty){
			m=l.matchFirst(r2);
		}
		
		if(!m.empty){
			nh=m[1].to!int;
			if(nh!=prev){
				if(prev>=0){
					writeln(prev, conn, nh);
				}
				prev=nh;
			}
		}
	}
}
