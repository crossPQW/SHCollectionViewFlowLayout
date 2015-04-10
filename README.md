# SHCollectionViewFlowLayout
通过瀑布流UICollectionView实现类似于iOS原生短信界面的弹簧效果

#使用方法
导入SHCollectionViewFlowLayout到你自己项目中,舍弃系统的UICollectionViewFlowLayout.具体看demo
弹簧效果的强度等可以通过以下三个参数调节:

`
    spring.length = 0;
    spring.damping = 0.5;
    spring.frequency = 0.8f;
`
![image](http://github.com/crossPQW/SHCollectionViewFlowLayout/raw/master/resoures/layout.gif)

#注意事项
如果给collectionView设置了数据源并且通过reloadData刷新数据的话,需要再刷新数据的时候调用reset方法.
