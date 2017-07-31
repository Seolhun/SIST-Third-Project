package com.sist.mapred;

import java.io.File;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.springframework.stereotype.Component;

@Component
public class MovieDriver {
	public void movieMapReduce(String singer){
		try{
			Configuration conf=new Configuration();
			Job job=new Job(conf,"SongCount");
			job.setJarByClass(MovieDriver.class);
			job.setMapperClass(MovieMapper.class);
			job.setReducerClass(MovieReducer.class);
			
			job.setOutputKeyClass(Text.class);
			job.setOutputValueClass(IntWritable.class);
			
			FileInputFormat.addInputPath(job, new Path("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/desc.txt"));
			
			File dir=new File("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/output/"+singer);
			if(dir.exists()){
				File[] files=dir.listFiles();
				for(File f:files){
					f.delete();
				}
				dir.delete();
			}
			
			FileOutputFormat.setOutputPath(job, new Path("/home/sist/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SIST/output/"+singer));
			job.waitForCompletion(true);
			}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
}
