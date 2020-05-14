//
//  TrackingViewController.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import UIKit

class TrackingViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var currentPageIndex = 0
    var pagesArray: [TrackingPageModel]!
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        MoodTrackingPages.createTrackingPages()
        pagesArray = MoodTrackingPages.getTrackingPages()
        configurePageViewController()
    }
    
    
    func configurePageViewController() {
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: TrackingPageViewController.self)) as? TrackingPageViewController else {
            return
        }
        self.pageViewController = pageViewController
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChildViewController(pageViewController)
        pageViewController.didMove(toParentViewController: self)
        
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pageViewController.view)
        
        let views : [String: Any] = ["pageView" : pageViewController.view]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        guard let startingViewController = trackingContentViewControllerAt(index: currentPageIndex) else {
            return
        }
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        enableDisableNext(currentIndex: currentPageIndex)
        
    }
    
    func addTrackingPageForMood(mood: String) {
        pagesArray.append(MoodTrackingPages.createTRackingPageFor(mood: mood))
        enableDisableNext(currentIndex: currentPageIndex)
//        self.pageViewController!.dataSource = nil
//        self.pageViewController!.dataSource = self
    }
    
    func removeTrackingPageForMood(mood: String) {
        var idx: Int?
        var count = 0
        for page in pagesArray {
            if page.pageType == .EXERCISE && page.moodPageName == mood {
                idx = count
                break
            }
            count = count + 1
        }
        if idx != nil {
            pagesArray.remove(at: idx!)
            enableDisableNext(currentIndex: currentPageIndex)
//            self.pageViewController!.dataSource = nil
//            self.pageViewController!.dataSource = self
        }
    }
    
    func trackingContentViewControllerAt(index: Int) ->  TrackingContentViewController? {
        
        if index >= pagesArray.count || pagesArray.count == 0 {
            return nil
        }
        var controllerType: String!
        switch pagesArray[index].pageType {
        case .MOOD:
            controllerType = String(describing: MoodTrackingContentController.self)
            break
        case .EXERCISE:
            controllerType = String(describing: ExerciseTrackingContentController.self)
            break
        case .REFLECTION:
            controllerType = String(describing: ReflectionTrackingContentController.self)
            break
        default:
            break
        }
        guard let trackingContentViewController = storyboard?.instantiateViewController(withIdentifier: controllerType) as? TrackingContentViewController else {
            return nil
        }
        
        trackingContentViewController.setTrackingContent(pageIdx: index, trackingPage: pagesArray[index], trackingView: self)
        
        return trackingContentViewController
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let index = (pageViewController.viewControllers?.last as? TrackingContentViewController)?.pageIndex else {
            return 0
        }
        return index
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesArray.count
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let trackingContentController = viewController as? TrackingContentViewController
        
        guard let currentIndex = trackingContentController?.pageIndex else {
            return nil
        }
        
//        currentPageIndex = currentIndex
        if currentIndex == 0 {
            return nil
        }
//        currentIndex = currentIndex - 1
        return trackingContentViewControllerAt(index: currentIndex - 1)
        
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let trackingContentController = viewController as? TrackingContentViewController
        
        guard let currentIndex = trackingContentController?.pageIndex else {
            return nil
        }
        
//        currentPageIndex = currentIndex
        if currentIndex == pagesArray.count {
            return nil
        }
//        currentIndex = currentIndex + 1
        return trackingContentViewControllerAt(index: currentIndex + 1)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentIndex = (pageViewController.viewControllers?.last as? TrackingContentViewController)?.pageIndex else {
            return
        }
        if completed {
            enableDisableNext(currentIndex: currentIndex)
        }
    }
    
    func enableDisableNext(currentIndex: Int) {
        if currentIndex == pagesArray.count-1 {
            self.nextButton.isEnabled = true
            self.nextButton.alpha = 1
        }else{
            self.nextButton.isEnabled = false
            self.nextButton.alpha = 0.5
        }
    }
    
 
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
