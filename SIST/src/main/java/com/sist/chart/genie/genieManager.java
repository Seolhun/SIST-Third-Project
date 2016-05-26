package com.sist.chart.genie;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

@Component
public class genieManager {
	public List<genieVO> genieAllData() {
		List<genieVO> list = new ArrayList<genieVO>();
		try {
			Document doc = Jsoup.connect("http://www.genie.co.kr/chart/top100").get();
			Elements rank = doc.select("div.newest-list div.list-wrap span.number");
			Elements titles = doc.select("div.newest-list div.music-list-wrap span.music_area span.music a.title");
			Elements artists = doc.select("div.newest-list div.music-list-wrap div.list-wrap span.music_area a.artist");
			for (int i = 0; i < rank.size(); i++) {
				Element grank = rank.get(i);
				Element title = titles.get(i);
				Element artist = artists.get(i);
				genieVO vo = new genieVO();
				vo.setRank(Integer.parseInt(grank.text()));
				vo.setTitles(title.text());
				vo.setArtists(artist.text());
				list.add(vo);
			}

		} catch (Exception ex) {
			System.out.println("genieAllData¿¡·¯: " + ex.getMessage());
		}
		return list;
	}
}
