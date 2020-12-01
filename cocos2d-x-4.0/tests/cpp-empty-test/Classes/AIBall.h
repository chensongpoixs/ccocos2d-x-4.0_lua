//
//  AIBall.h
//
//

#ifndef __PlanetWar__AIBall__ 
#define __PlanetWar__AIBall__
#include "BaseBall.h"
#include "platform/CCPlatformMacros.h"
#include "cocos2d.h"
#include "cocos/scripting/deprecated/CCString.h"
USING_NS_CC;

class AIBall : public BaseBall {

/** 重写函数 **/
public:
    static AIBall* create();
	virtual bool init();
    // 绘制图形
    virtual void draw(Renderer*renderer, const Mat4& transform, uint32_t flags);
    // 安帧更新
    virtual void update(float time);
    // 缩放
    virtual void scale(const float scale);
    // 析构函数
    virtual ~AIBall();

/** 内部变量和函数 **/
protected:
    Vec2 direction = Vec2::ZERO;    // 移动方向
    int speed = 0;                  // 移动速度
    float speedFactor = 1;          // 速度控制因子
    double speedInterval;           // 移动间隔帧数
    double intervalCount;           // 间隔帧数计数器
    int eatAINum = 0;               // 吃AI球数量
    int eatBaseNum = 0;             // 吃base球数量
    
    // 子类通用初始化
    virtual void commenInit();
    // 移动
    virtual void thisUpdate(float delta);
    // 碰撞检测
    virtual void sharedUpdate(float delta);
    // AIball太大会自爆
    void checkExplode();
    
/** 对外接口 **/
public:
    // 名字标签
    cocos2d::Label *label_tag;
    
    // setter
    virtual void updateWeight(int addedWeight);
    void scaleSpeed(const float scale){speed *= scale;};
    virtual void setLabel(const __String label);
    void setDirection(const Vec2 dir){direction = dir;}
    void setIntervalCount(const float interval){intervalCount = interval>1.0 ? interval : 1.0;}
    void setSpeedFactor(const float factor){speedFactor = factor;};
    // getter
    const Vec2 getDirection()const{return direction;}
    const float getSpeedFactor()const{return speedFactor;}
    const float getSpeedInterval()const{return speedInterval;}
    const int getEatAINum()const{return eatAINum;};
    const int getEatBaseNum()const{return eatBaseNum;}
    
};

#endif /* defined(__PlanetWar__AIBall__) */
