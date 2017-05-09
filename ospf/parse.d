import std.stdio;
import std.range;
import std.algorithm;
import std.regex;
import std.typecons;
import std.conv;
import std.uni;

void main(string[] argv){
	/*
	auto r=ctRegex!"\\s*[0-9]+\\s+([A-Z]+)-([a-zA-Z]+).group([0-9]+)";
	auto ins=stdin
		.byLine
		.drop(2);
	auto str=ins
		.map!(
			(a){
				auto res=a.matchFirst(r);
				return tuple(res[1],res[2], res[3].to!uint);
			}
	);
	string prev=argv[1];
	foreach(v; str){
		string next;
		if(v[0]=="HOST"){
			next=v[1].toUpper.idup;
		}
		else{
			next=v[0].idup;
		}
			writeln(prev, argv[2], next,";");
			prev=next;
	}
	*/
	
	bool[string] registry;
	auto r=ctRegex!"([A-Z]+)-([a-zA-Z]+).group[0-9]+";
	auto ins=stdin
		.byLine
		.drop(2);
	foreach(l; ins){
		foreach(m;l.matchAll(r)){
			auto a=m[1];
			auto b=m[2];
			string aa,bb;
			if(a=="HOST"){
				aa=b.toUpper.idup;
			}
			else{
				aa=a.idup;
			}
			if(b=="host"){
				bb=a.idup;
			}
			else{
				bb=b.toUpper.idup;
			}
			string desc=aa~"-"~bb;
			if(!(desc in registry)){
				writeln(aa, argv[1], bb,";");
				registry[desc]=true;
			}
		}
	}
}
