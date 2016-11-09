package com.sist.mapred;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.*;

public class MovieMapper extends Mapper<LongWritable, Text, Text, IntWritable>{
	private final IntWritable one=new IntWritable(1);
	private Text result=new Text();
	String[] feel = {"아이돌","여자","남자","댄스","힙합","알앤비","재즈","록","일렉","사랑","덕"
			+"대세","갓","실력파","실력있는","실력없는","빻","발라드","동요","해외","그룹","우울","차분"
			+"경쾌","콧소리","저음","고음","고막","안구","테러","삼고초려","학교","어리","가창력"
			+"예능","걸","보이","남심","여심","좆","귀르가즘","세련","좋다","나쁘다","잘뽑","감성","소울","필","충만"
			+"풍만","깜찍","중저음","동굴","옥타브","가왕","돌고래","초음파","매력","대장","내장","복식","정화"};
	Pattern[] pattern=new Pattern[feel.length];
	@Override
	protected void map(LongWritable key, Text value, Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
			for(int i=0;i<feel.length;i++){
				pattern[i]=Pattern.compile(feel[i]);
			}
			Matcher[] matcher=new Matcher[feel.length];
			for(int i=0;i<feel.length;i++){
				matcher[i]=pattern[i].matcher(value.toString());
				while(matcher[i].find()){
					result.set(feel[i]);
					context.write(result, one);
				}
			}
	}
	
	
}
