package com.gyull.webnovel.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.mapper.storyroom.StoryRoomMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class BookCoverCheckTask {

	@Setter(onMethod_ = {@Autowired})
	private StoryRoomMapper mapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	/* @Scheduled(cron="0 0 05 * * ?") */
	public void checkBookCovers() throws Exception {
		
		log.warn("File Check Task run ... ");
		log.warn(new Date());
		
		//file list in db
		List<BookVO> BookCoverList = mapper.getOldBookCover();
		
		//ready for check img in directory with db img list
		List<Path> BookCoverListPaths = BookCoverList.stream()
				.map(vo -> Paths.get("C:\\upload", vo.getBook_imgUrl(), vo.getBook_imgName()))
				.collect(Collectors.toList());
		
		log.warn("------------------------");
		//img in yesterday directory
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] removeBookCovers = targetDir.listFiles(BookCover -> BookCoverListPaths.contains(BookCover.toPath()) == false);
		log.warn("------------------------");
		for(File bookCover : removeBookCovers) {
			log.warn(bookCover.getAbsolutePath());
			bookCover.delete();
		}
	}
}
