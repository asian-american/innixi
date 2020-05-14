//
//  OnboardingViewController.swift
//  Innixi
//
//  Created by Rahul on 30/04/20.
//

import UIKit

class OnboardingViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    @IBOutlet weak var onboardingView: UIView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var pagesArray = [OnboardingPageModel]()
    var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OnboardingPages.createPages()
            
        pagesArray = OnboardingPages.getOnboardingPages()
        configurePageViewController()
    }
        
        
    func configurePageViewController() {
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: OnboardingPageViewController.self)) as? OnboardingPageViewController else {
            return
        }
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChildViewController(pageViewController)
        pageViewController.didMove(toParentViewController: self)
        
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.addSubview(pageViewController.view)
        
        let views : [String: Any] = ["pageView" : pageViewController.view]
        
        onboardingView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        onboardingView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        guard let startingViewController = trackingContentViewControllerAt(index: currentPageIndex) else {
            return
        }
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        
    }
        
        
    func trackingContentViewControllerAt(index: Int) ->  OnboardingContentViewController? {
        
        if index >= pagesArray.count || pagesArray.count == 0 {
            return nil
        }
        
        guard let trackingContentViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: OnboardingContentViewController.self)) as? OnboardingContentViewController else {
            return nil
        }
        
        trackingContentViewController.setOnboardingContent(pageIdx: index, onboardingPage: pagesArray[index])
        
        return trackingContentViewController
    }
        
        
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let index = (pageViewController.viewControllers?.last as? OnboardingContentViewController)?.pageIndex else {
            return 0
        }
        return index
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesArray.count
    }
        
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let trackingContentController = viewController as? OnboardingContentViewController
        
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
        let trackingContentController = viewController as? OnboardingContentViewController
        
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
        guard let currentIndex = (pageViewController.viewControllers?.last as? OnboardingContentViewController)?.pageIndex else {
            return
        }
        if completed {
            if currentIndex == pagesArray.count-1 {
                self.nextButton.isEnabled = true
                self.nextButton.alpha = 1
            }else{
                self.nextButton.isEnabled = false
                self.nextButton.alpha = 0.5
            }
        }
    }
            
    

}
