$(() => {
  // getAllFirstCate();
  setAllCategories();
});

function getAllFirstCate() {
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
  // console.log(allCategoriesObj);
  let allFirstCate = [];
  for (let i in allCategoriesObj) {
    let {name, cateId} = allCategoriesObj[i];
    // console.log(name, cateId);
    // console.log({name, cateId});
    allFirstCate.push({name, cateId})
  }
  // console.log(allFirstCate);
  let tags = ''
  /*
    <li><a href="catlist.htm" target="_parent">家用电器</a></li>
    <li><a href="catlist.htm" target="_parent">手机数码</a></li>
    <li><a href="catlist.htm" target="_parent">日用百货</a></li>
    <li><a href="catlist.htm" target="_parent">&nbsp;书&nbsp;&nbsp;&nbsp;籍&nbsp;</a></li>
  * */
  for (let i in allFirstCate) {
    let {name, cateId} = allFirstCate[i];
    // console.log(name, cateId);
    tags += `<li><a href="catlist.htm?cateId=${cateId}" target="_parent">${allFirstCate[i].name}</a></li>`;
  }

  // console.log(tags);

  $("#mainPage").after(tags);



}

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
  let allCategories = `[
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
]`;
  let allCategoriesObj = JSON.parse(allCategories);
  console.log(allCategoriesObj);
  let allFirstCategories = []
  let aliiFirst2Second = []
  for (let i in allCategoriesObj) {
    let {name,secondCategory} = allCategoriesObj[i];
    allFirstCategories.push(name)
    aliiFirst2Second.push(secondCategory)
  }
  console.log("allFirstCategories-----:",allFirstCategories);
  console.log("aliiFirst2Second-----:",aliiFirst2Second);
  let tags = ``;
  for (let i = 0; i < allFirstCategories.length; i++) {
    console.log(allFirstCategories[i]);
    console.log(aliiFirst2Second[i]);
    let firstCategory = allFirstCategories[i];
    let secondCategories = aliiFirst2Second[i];

    let secondTag = '';
    for (let j in secondCategories) {
      console.log(secondCategories[j].name);
      console.log(secondCategories[j].cateId);
      secondTag += `<li><a href="catlist.htm?cateId="${secondCategories[j].cateId}>${secondCategories[j].name}</a></li>`;
    }
    console.log(secondTag);
    tags += `<ul>
								<h1>${allFirstCategories[i]}</h1>
								${secondTag}
							</ul>`;
    console.log(tags);
  }


}
