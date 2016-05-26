package com.sist.chart.bill;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;



@Component
public class billManager {
	public List<billVO> billAllData() {
		List<billVO> list = new ArrayList<billVO>();
		try {
			Document doc = Jsoup.connect("http://www.billboard.com/charts/hot-100").get();
			Elements rank = doc.select("div.chart-row__main-display div.chart-row__rank span.chart-row__current-week");
			Elements titles = doc.select("div.chart-row__container div.chart-row__title h2.chart-row__song");
			Elements artists = doc.select("div.chart-row__container div.chart-row__title a.chart-row__artist");
			for (int i = 0; i <= 49; i++) {
				Element brank = rank.get(i);
				Element btitle = titles.get(i);
				Element bartist = artists.get(i);
				billVO vo = new billVO();
				vo.setRank(Integer.parseInt(brank.text()));
				vo.setTitles(btitle.text());
				vo.setArtists(bartist.text());
				list.add(vo);
			}
		} catch (Exception ex) {
			System.out.println("billAllData¿¡·¯: " + ex.getMessage());
		}
		return list;
	}
}
