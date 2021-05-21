
//获取数据
getDataFromDB();
getHotProducts();

window.onload=function(){
	setAllCategories()
	setHotProducts()
	statueBar();
	init();
	show();
}
	var advInitTop=0;

	function init(){
  	document.getElementById("pairflag").className='show';
    window.onscroll = move;
  	}
  window.setTimeout("init()",600);

  function move(){
		document.getElementById("pairflag").style.top = (document.documentElement.scrollTop + 200)+'px';
  	}

  function leftClose(){
  	document.getElementById("closeLeft").style.visibility = "hidden";
  	document.getElementById("advLeft").style.visibility = "hidden";
  	}

  function rightClose(){
  	document.getElementById("closeRight").style.visibility = "hidden";
  	document.getElementById("advRight").style.visibility = "hidden";
  	}


  var nowFrame = 1;
	var maxFrame = 4;
	function show(curDiv) {
		if(Number(curDiv)){
			clearTimeout(theTimer);  //当触动按扭时，清除计时器
			nowFrame = curDiv;                //设当前显示图片
			}
		for(var i=1;i<=maxFrame;i++){
			document.getElementById('div' + i).style.display = (i == nowFrame) ? 'block' : 'none';   //当前图片显示
			}
		if(nowFrame == maxFrame){   //设置下一个显示的图片
			nowFrame = 1;
			}
		else{
			nowFrame++;
			}
		theTimer = setTimeout('show()', 3000);   //设置定时器，显示下一张图片
	}

  function statueBar(){
		window.status= "欢迎来到贵美商城的世界！如果喜欢本站请推荐给朋友。";
	}

	function switchMe(){
		nTab=arguments[0];
		document.getElementById('tabbody').style.display=((nTab==1)?"none":"block");
		document.getElementById('tab').className=((nTab==1)?"":"over");
	}

/**
 * 异步请求获取所有分类类名
 */
	function getDataFromDB() {
	if (!window.sessionStorage.getItem('allCategorise')) {
		$.ajax({
			url: "http://" + ip + ":8080/mall/category/getAllCategories",
			type: "post",
			async: false,
			contentType: "application/json",
			success: (data) => {
				if (data.code === "200") {
					console.log("获取数据成功");
					console.log(data.data);

					window.sessionStorage.setItem('allCategories', JSON.stringify(data.data));
				} else {
					console.log("获取数据失败");
				}
			},
			error: () => {
				console.log("出错了");
			}
		});
	}
	}

/**
 * 将所有一级分类和二级分类放进左侧分类导航栏
 */
function setAllCategories() {
	/*
  * <ul>
        <h1>家用电器</h1>
        <li><a href="catlist.htm">大家电</a></li>
        <li><a href="catlist.htm">洗衣机</a></li>
        <li><a href="catlist.htm">平板电视</a></li>
        <li><a href="catlist.htm">电热水器</a></li>
        <li><a href="catlist.htm">家庭音响</a></li>
        <li><a href="catlist.htm">热水器</a></li>
        <li><a href="catlist.htm">空调冰箱</a></li>
        <li><a href="catlist.htm">冷柜</a></li>
        <li><a href="catlist.htm">DVD</a></li>
        <li><a href="catlist.htm">电视附件</a></li>
        <li><a href="catlist.htm">电燃气</a></li>
        <li><a href="catlist.htm">家电下乡</a></li>
        <li><a href="catlist.htm">家电服务</a></li>
        <li><a href="catlist.htm">电饭煲</a></li>
        <li><a href="catlist.htm">摄像机</a></li>
      </ul>
  * */
	/*let allCategories = `[
  {
    "secondCategory": [
      {
        "cateId": 5,
        "name": "冰箱"
      }
    ],
    "cateId": 1,
    "name": "家用电器"
  },
  {
    "secondCategory": [],
    "cateId": 2,
    "name": "手机数码"
  },
  {
    "secondCategory": [],
    "cateId": 3,
    "name": "日用百货"
  },
  {
    "secondCategory": [
      {
        "cateId": 10,
        "name": "科幻小说"
      }
    ],
    "cateId": 4,
    "name": "书籍"
  }
]`;*/
	let allCategories = window.sessionStorage.getItem('allCategories')
	let allCategoriesObj = JSON.parse(allCategories);
	console.log(allCategoriesObj);
	let allFirstCategories = []
	let allFirst2Second = []
	for (let i in allCategoriesObj) {
		let {name,secondCategory} = allCategoriesObj[i];
		allFirstCategories.push(name)
		allFirst2Second.push(secondCategory)
	}
	console.log("allFirstCategories-----:",allFirstCategories);
	console.log("aliiFirst2Second-----:",allFirst2Second);
	let tags = ``;
	for (let i = 0; i < allFirstCategories.length; i++) {
		console.log(allFirstCategories[i]);
		console.log(allFirst2Second[i]);
		let firstCategory = allFirstCategories[i];
		let secondCategories = allFirst2Second[i];

		let secondTag = '';
		for (let j in secondCategories) {
			console.log(secondCategories[j].name);
			console.log(secondCategories[j].cateId);
			secondTag += `<li><a href="catlist.htm?cateId=${secondCategories[j].cateId}">${secondCategories[j].name}</a></li>`;
		}
		console.log(secondTag);
		tags += `<ul>
								<h1>${allFirstCategories[i]}</h1>
								<div class="secondCateList">
									${secondTag}
								</div>
							</ul>`;

	}
	console.log(tags);
	$(tags).appendTo(".cat");
}

/**
 * 展示疯狂抢购的商品
 */
function getHotProducts() {
	$.ajax({
		url: "http://" + ip + ":8080/mall/product/getHotProducts",
		type: "post",
		async: false,
		contentType: "application/json",
		success: (data) => {
			if (data.code === "200") {
				console.log("获取数据成功");
				console.log(data.data);
				window.sessionStorage.setItem('hotProducts', JSON.stringify(data.data));
			} else {
				console.log("获取数据失败");
			}
		},
		error: () => {
			console.log("出错了");
		}
	});
}

function setHotProducts() {
	let hotProducts = window.sessionStorage.getItem("hotProducts");
	let hotProductsObj = JSON.parse(hotProducts);
	console.log("hotProductsObj:",hotProductsObj);

	let tags = ""
	for (let i in hotProductsObj) {
		let {name, proId, mainImage} = hotProductsObj[i];
		tags += `<dl>
								<a href="info.htm?proId=${proId}">
								<dt>
									<img src="http://${ip}:8080/mall${mainImage}" alt="alt" style="width: 80px;height: 80px"/>
								</dt>
								<dd>${name}</dd>
								</a>
						</dl>`
	}
	console.log(tags);

	$(tags).appendTo(".content_list")
}


