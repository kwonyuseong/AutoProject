public Pagination(int listCnt, int curPage){

        /**
         * 페이징 처리 순서
         * 1. 총 페이지수
         * 2. 총 블럭(range)수
         * 3. range setting
         */

        // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
        /** 현재페이지 **/
        setCurPage(curPage);
        /** 총 게시물 수 **/
          this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
        /** 1. 총 페이지 수 **/
        setPageCnt(listCnt);
        /** 2. 총 블럭(range)수 **/
        this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
        /** 3. 블럭(range) setting **/
        this.curRange = (int)((curPage-1)/rangeSize) + 1;
        
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;

        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }

        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
        /** DB 질의를 위한 startIndex 설정 **/
        this.startIndex = (curPage-1) * pageSize;
    }
