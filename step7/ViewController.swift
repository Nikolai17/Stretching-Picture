//
//  ViewController.swift
//  step7
//
//  Created by Nikolay Volnikov on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self

        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        scrollView.verticalScrollIndicatorInsets.top = height - view.safeAreaInsets.top

        return scrollView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "mem")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.origin = .zero
        imageView.frame.size = CGSize(width: view.frame.width, height: height)
        return imageView
    }()

    private let height: CGFloat = 270

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            let imageViewHeight = height - scrollView.contentOffset.y

            imageView.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
            imageView.frame.size = CGSize(width: view.frame.width, height: imageViewHeight)
            scrollView.verticalScrollIndicatorInsets.top = imageViewHeight - view.safeAreaInsets.top
        }
    }
}
