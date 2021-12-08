using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;


class Program {
  public static void Main () {
		Parse.Main();
  }
}

public class Board
	{

	public List<int[]> Points;
	public IDictionary<string, int> Dict;
	public Board()
	{
		Points = new List<int[]>();
		Dict = new Dictionary<string, int>();
	}	

	public void Set( int[] start, int[] end)
	{
		int startX = start[0];
		int startY = start[1];
		int endX = end[0];
		int endY = end[1];

		//Points.Add(start);
		var v1 = $"{startX},{startY}";
		if (Dict.ContainsKey(v1)) {
			Dict[v1] += 1;
		} else {
			Dict.Add(v1, 1);
		}
		do {
			if (startX > endX) {
				startX -= 1;
			} else if (startX < endX) {
				startX += 1;
			} 
			if (startY > endY) {
				startY -= 1;
			} else if (startY < endY) {
				startY += 1;
			}
			var tempStep = new int[] {startX, startY};

			//Points.Add(tempStep);
			var v = $"{startX},{startY}";

			if (Dict.ContainsKey(v)) {
				Dict[v] += 1;
			} else {
				Dict.Add(v, 1);
			}

		} while (startX != endX | startY != endY);

	}

	public void Print()
	{
		foreach (var el in Points)
		{
			Console.WriteLine($"{el[0]} - {el[1]}");
		}
	}

	public int CheckDup2 () {
		int result = 0;
		foreach(var entry in Dict)
		{
			if (entry.Value > 1){
				result++;
			}
		}	
		return result;
	}



}

public class Parse {
	public static void Main() {
		string path = "input.txt";
		string[] text = System.IO.File.ReadAllLines(path);
		var val = text.Select( x => x.Split(" -> ").Select(x => x.Split(",")));
		var board1 = new Board();
		var board2 = new Board();
		foreach (IEnumerable<string[]> s in val) {
			var d = s.ToList();
			var start = new int[] {Int32.Parse(d[0][0]), Int32.Parse(d[0][1])}; 
			var end = new int[] {Int32.Parse(d[1][0]), Int32.Parse(d[1][1])}; 

				if (d[0][0] == d[1][0] || d[0][1] == d[1][1])
				{
					board1.Set(start, end);
				}
				board2.Set(start, end);
		}
		var solution1 = board1.CheckDup2();
		var solution2 = board2.CheckDup2();
		Console.WriteLine($"Solution 2: {solution2}");
		Console.WriteLine($"Solution 1: {solution1}");

	}
}
