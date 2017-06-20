# SysTransitionable

## Usage

```
class MyNavigationController : UINavigationController , SysTransitionable 
{
}
```

```
// code in vc, vc is root of MyNavigationController

let nextVc = NextViewController()
navigationController.pushViewController(nextVc,animated : false, sysTransition : .fade)


```
