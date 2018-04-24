import UIKit

extension UIView {
    func animateWheelReflection( values: [Double], keyTimes: [NSNumber
        ], animatedImageView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let wheelReflectionAnimation = CAKeyframeAnimation()
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            wheelReflectionAnimation.keyPath = "transform.rotation"
            wheelReflectionAnimation.values = values
            wheelReflectionAnimation.keyTimes = keyTimes
            wheelReflectionAnimation.duration = duration
            wheelReflectionAnimation.repeatCount = repeatCount
            
            animatedImageView.layer.add(wheelReflectionAnimation, forKey: "move")
        }, completion: nil)
    }
    
    func shakeXY(values: [NSValue], keyTimes: [NSNumber
        ], animatedImageView: UIImageView, duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let repeatCount = Float(animationDuration / duration)
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
        
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            shakeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            shakeAnimation.duration = duration
            shakeAnimation.values = values
            shakeAnimation.keyTimes = keyTimes
            shakeAnimation.repeatCount = repeatCount
            animatedImageView.layer.add(shakeAnimation, forKey: "shake")
        }, completion: nil)
    }
    
    
    func stretchX(animatedImageView: UIImageView, values: [Double], keytimes: [NSNumber], duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let pipeStretchAnimation = CAKeyframeAnimation()
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            pipeStretchAnimation.keyPath = "transform.scale.x"
            pipeStretchAnimation.values = values
            pipeStretchAnimation.keyTimes = keytimes
            pipeStretchAnimation.duration = duration
            pipeStretchAnimation.repeatCount = repeatCount
            
            animatedImageView.layer.add(pipeStretchAnimation, forKey: "move")
            
        }, completion: nil)
    }
    
    func stretchXY(values: [Double], animatedImageView: UIImageView, keytimes: [NSNumber], duration: CFTimeInterval, animationDuration: CFTimeInterval) {
        let pipeStretchAnimation = CAKeyframeAnimation()
        let repeatCount = Float(animationDuration / duration)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            pipeStretchAnimation.keyPath = "transform.scale"
            pipeStretchAnimation.values = values
            pipeStretchAnimation.keyTimes = keytimes
            pipeStretchAnimation.duration = duration
            pipeStretchAnimation.repeatCount = repeatCount
            
            animatedImageView.layer.add(pipeStretchAnimation, forKey: "move")
            
        }, completion: nil)
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, view: UIView){
        let oldOrigin = view.frame.origin
        view.layer.anchorPoint = anchorPoint
        let newOrigin = view.frame.origin
        
        let transition = CGPoint(x: newOrigin.x - oldOrigin.x, y: newOrigin.y - oldOrigin.y)
        
        view.center = CGPoint(x: view.center.x - transition.x, y: view.center.y - transition.y)
    }
    
    func fadeInanOut(values: [Double], animatedImageView: UIImageView, keytimes: [NSNumber], duration: CFTimeInterval, animationDuration: CFTimeInterval){
        let repeatCount = Float(animationDuration / duration)
        let fadeInanOutAnimation = CAKeyframeAnimation()
        
        fadeInanOutAnimation.duration = animationDuration
        fadeInanOutAnimation.keyPath = "opacity"
        fadeInanOutAnimation.repeatCount = repeatCount
        fadeInanOutAnimation.keyTimes = keytimes
        fadeInanOutAnimation.values = values
        
        
        animatedImageView.layer.add(fadeInanOutAnimation, forKey: "move")
    }
    
}
extension UIViewKeyframeAnimationOptions {
    
    init(animationOptions: UIViewAnimationOptions) {
        rawValue = animationOptions.rawValue
    }
    
}
