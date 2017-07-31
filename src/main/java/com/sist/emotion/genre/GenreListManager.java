package com.sist.emotion.genre;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Component;

@Component
public class GenreListManager {
	
	public List<DanceVO> GenDance()
	{
		List<DanceVO> list=new ArrayList<DanceVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0101").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					DanceVO vo=new DanceVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					DanceVO vo=new DanceVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenDance(): "+ex.getMessage());
		}
		return list;
	}
	
	
	public List<BaladVO> GenBalad()
	{
		List<BaladVO> list=new ArrayList<BaladVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0102").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					BaladVO vo=new BaladVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					BaladVO vo=new BaladVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenBalad(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	public List<RapHipVO> GenRapHip()
	{
		List<RapHipVO> list=new ArrayList<RapHipVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0204").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					RapHipVO vo=new RapHipVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					RapHipVO vo=new RapHipVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenRapHip(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	public List<RnBVO> GenRnB()
	{
		List<RnBVO> list=new ArrayList<RnBVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0203").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					RnBVO vo=new RnBVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					RnBVO vo=new RnBVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenRnB(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	public List<RockVO> GenRock()
	{
		List<RockVO> list=new ArrayList<RockVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0202").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					RockVO vo=new RockVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					RockVO vo=new RockVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenRock(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	public List<ElecVO> GenElec()
	{
		List<ElecVO> list=new ArrayList<ElecVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0205").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					ElecVO vo=new ElecVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
					
				}
				else
				{
					String album=al;
					ElecVO vo=new ElecVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenElec(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	
	public List<ForkVO> GenFork()
	{
		List<ForkVO> list=new ArrayList<ForkVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0108").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					ForkVO vo=new ForkVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);	
				}
				else
				{
					String album=al;
					ForkVO vo=new ForkVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);					
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenFork(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	
	public List<PoppVO> GenPopp()
	{
		List<PoppVO> list=new ArrayList<PoppVO>();
		try
		{
			Document doc=Jsoup.connect("http://www.genie.co.kr/genre/L0201").get();
			Elements noElem=doc.select("div.list span.number");
			Elements titleElem=doc.select("div.list span.music-info span.music_area span.music a.title");
			Elements artistElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.artist");
			Elements albumElem=doc.select("div.list span.music-info span.music_area span.music span.meta a.albumtitle");
			
			for(int i=0;i<noElem.size();i++)
			{
				Element nelem=noElem.get(i);
				Element telem=titleElem.get(i);
				Element albelem=albumElem.get(i);
				String al=albelem.text();
				Element artelem=artistElem.get(i);
				String artist=artelem.text();
				if(al.length()>20)
				{
					String album=al.substring(0, 19);
					PoppVO vo=new PoppVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);	
				}
				else
				{
					String album=al;
					PoppVO vo=new PoppVO();
					vo.setNo(nelem.text());
					vo.setTitle(telem.text());
					vo.setAlbum(album);
					vo.setArtist(artist);
					list.add(vo);					
				}
			}
		}catch(Exception ex)
		{
			System.out.println("GenPopp(): "+ex.getMessage());
		}
		return list;
	}
	
	
	
	
}
