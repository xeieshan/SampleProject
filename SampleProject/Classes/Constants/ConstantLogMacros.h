//
//  ConstantLogMacros.h
//  SampleProject
//
//  Created by <#Project Developer#> on 19/10/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#ifndef ConstantLogMacros_h
#define ConstantLogMacros_h

//New Debugger Logging

#import <UIKit/UIKit.h>

#if TARGET_OS_IPHONE

#define SPEdgeInsets    UIEdgeInsets
#define SPOffset        UIOffset
#define valueWithSPOffset   valueWithUIOffset
#define valueWithSPEdgeInsets   valueWithUIEdgeInsets

#elif TARGET_OS_MAC

#define SPEdgeInsets    NSEdgeInsets
#define SPOffset        NSOffset
#define valueWithSPOffset   valueWithNSOffset
#define valueWithSPEdgeInsets   valueWithNSEdgeInsets

#endif

#define stringify               __STRING
#define SPType(var)             __typeof__((var))
#define SPBox(var)              __sp_box(@encode(SPType(var)), (var))
#define SPBoxToString(var)      [SPBox(var) description]
#define SPTypeStringOfVar(var)  __sp_type_string_for_var(@encode(SPType(var)), (var))

#ifdef DEBUG
#define SPPrintf(fmt, ...)  printf("🎈%s + %d📍 %s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:fmt, ##__VA_ARGS__]UTF8String])
#define SPDBAnyVar(var)     SPPrintf(@"%s = %@", #var, SPBox(var))
#define SPPrintAnything(x)   printf("🎈%s + %d📍 %s\n", __PRETTY_FUNCTION__, __LINE__, #x)
#else
#define SPPrintf(fmt, ...)
#define SPDBAnyVar(any)
#define SPPrintAnything(x)
#endif

static inline id __sp_box(const char * type, ...)
{
    va_list variable_param_list;
    va_start(variable_param_list, type);
    
    id object = nil;
    
    if (strcmp(type, @encode(id)) == 0) {
        id param = va_arg(variable_param_list, id);
        object = param;
    }
    else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint param = (CGPoint)va_arg(variable_param_list, CGPoint);
        object = [NSValue valueWithCGPoint:param];
    }
    else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize param = (CGSize)va_arg(variable_param_list, CGSize);
        object = [NSValue valueWithCGSize:param];
    }
    else if (strcmp(type, @encode(CGVector)) == 0) {
        CGVector param = (CGVector)va_arg(variable_param_list, CGVector);
        object = [NSValue valueWithCGVector:param];
    }
    else if (strcmp(type, @encode(CGRect)) == 0) {
        CGRect param = (CGRect)va_arg(variable_param_list, CGRect);
        object = [NSValue valueWithCGRect:param];
    }
    else if (strcmp(type, @encode(NSRange)) == 0) {
        NSRange param = (NSRange)va_arg(variable_param_list, NSRange);
        object = [NSValue valueWithRange:param];
    }
    else if (strcmp(type, @encode(CFRange)) == 0) {
        CFRange param = (CFRange)va_arg(variable_param_list, CFRange);
        object = [NSValue value:&param withObjCType:type];
    }
    else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
        CGAffineTransform param = (CGAffineTransform)va_arg(variable_param_list, CGAffineTransform);
        object = [NSValue valueWithCGAffineTransform:param];
    }
    else if (strcmp(type, @encode(CATransform3D)) == 0) {
        CATransform3D param = (CATransform3D)va_arg(variable_param_list, CATransform3D);
        object = [NSValue valueWithCATransform3D:param];
    }
    else if (strcmp(type, @encode(SEL)) == 0) {
        SEL param = (SEL)va_arg(variable_param_list, SEL);
        object = NSStringFromSelector(param);
    }
    else if (strcmp(type, @encode(Class)) == 0) {
        Class param = (Class)va_arg(variable_param_list, Class);
        object = NSStringFromClass(param);
    }
    else if (strcmp(type, @encode(SPOffset)) == 0) {
        SPOffset param = (SPOffset)va_arg(variable_param_list, SPOffset);
        object = [NSValue valueWithSPOffset:param];
    }
    else if (strcmp(type, @encode(SPEdgeInsets)) == 0) {
        SPEdgeInsets param = (SPEdgeInsets)va_arg(variable_param_list, SPEdgeInsets);
        object = [NSValue valueWithSPEdgeInsets:param];
    }
    else if (strcmp(type, @encode(short)) == 0) {
        short param = (short)va_arg(variable_param_list, int);
        object = @(param);
    }
    else if (strcmp(type, @encode(int)) == 0) {
        int param = (int)va_arg(variable_param_list, int);
        object = @(param);
    }
    else if (strcmp(type, @encode(long)) == 0) {
        long param = (long)va_arg(variable_param_list, long);
        object = @(param);
    }
    else if (strcmp(type, @encode(long long)) == 0) {
        long long param = (long long)va_arg(variable_param_list, long long);
        object = @(param);
    }
    else if (strcmp(type, @encode(float)) == 0) {
        float param = (float)va_arg(variable_param_list, double);
        object = @(param);
    }
    else if (strcmp(type, @encode(double)) == 0) {
        double param = (double)va_arg(variable_param_list, double);
        object = @(param);
    }
    else if (strcmp(type, @encode(BOOL)) == 0) {
        BOOL param = (BOOL)va_arg(variable_param_list, int);
        object = param ? @"YES" : @"NO";
    }
    else if (strcmp(type, @encode(bool)) == 0) {
        bool param = (bool)va_arg(variable_param_list, int);
        object = param ? @"true" : @"false";
    }
    else if (strcmp(type, @encode(char)) == 0) {
        char param = (char)va_arg(variable_param_list, int);
        object = [NSString stringWithFormat:@"%c", param];
    }
    else if (strcmp(type, @encode(unsigned short)) == 0) {
        unsigned short param = (unsigned short)va_arg(variable_param_list, unsigned int);
        object = @(param);
    }
    else if (strcmp(type, @encode(unsigned int)) == 0) {
        unsigned int param = (unsigned int)va_arg(variable_param_list, unsigned int);
        object = @(param);
    }
    else if (strcmp(type, @encode(unsigned long)) == 0) {
        unsigned long param = (unsigned long)va_arg(variable_param_list, unsigned long);
        object = @(param);
    }
    else if (strcmp(type, @encode(unsigned long long)) == 0) {
        unsigned long long param = (unsigned long long)va_arg(variable_param_list, unsigned long long);
        object = @(param);
    }
    else if (strcmp(type, @encode(unsigned char)) == 0) {
        unsigned char param = (unsigned char)va_arg(variable_param_list, unsigned int);
        object = [NSString stringWithFormat:@"%c", param];
    }
    else {
        void * param = (void *)va_arg(variable_param_list, void *);
        object = [NSString stringWithFormat:@"%p", param];
    }
    
    va_end(variable_param_list);
    
    return object;
}

static inline char __sp_first_char_for_string(const char * string)
{
    if (strlen(string) > 0) {
        return string[0];
    }
    else {
        return '\0';
    }
}

static inline char __sp_last_char_for_string(const char * string)
{
    if (strlen(string) > 0) {
        return string[strlen(string) - 1];
    }
    else {
        return '\0';
    }
}

static inline NSString * __sp_type_string_for_var(const char * type, ...)
{
    va_list variable_param_list;
    va_start(variable_param_list, type);
    
    NSString * typeString = nil;
    
    if (strcmp(type, @encode(id)) == 0) {
        
        id param = va_arg(variable_param_list, id);
        typeString = NSStringFromClass([param class]);
    }
    else if (strcmp(type, @encode(CGPoint)) == 0) {
        
        typeString = @stringify(CGPoint);
    }
    else if (strcmp(type, @encode(CGSize)) == 0) {
        
        typeString = @stringify(CGSize);
    }
    else if (strcmp(type, @encode(CGVector)) == 0) {
        
        typeString = @stringify(CGVector);
    }
    else if (strcmp(type, @encode(CGRect)) == 0) {
        
        typeString = @stringify(CGRect);
    }
    else if (strcmp(type, @encode(NSRange)) == 0) {
        
        typeString = @stringify(NSRange);
    }
    else if (strcmp(type, @encode(CFRange)) == 0) {
        
        typeString = @stringify(CFRange);
    }
    else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
        
        typeString = @stringify(CGAffineTransform);
    }
    else if (strcmp(type, @encode(CATransform3D)) == 0) {
        
        typeString = @stringify(CATransform3D);
    }
    else if (strcmp(type, @encode(SEL)) == 0) {
        
        typeString = @stringify(SEL);
    }
    else if (strcmp(type, @encode(Class)) == 0) {
        
        typeString = @stringify(Class);
    }
    else if (strcmp(type, @encode(SPOffset)) == 0) {
        
        typeString = @stringify(SPOffset);
    }
    else if (strcmp(type, @encode(SPEdgeInsets)) == 0) {
        
        typeString = @stringify(SPEdgeInsets);
    }
    else if (strcmp(type, @encode(short)) == 0) {
        
        typeString = @stringify(short);
    }
    else if (strcmp(type, @encode(int)) == 0) {
        
        typeString = @stringify(int);
    }
    else if (strcmp(type, @encode(long)) == 0) {
        
        typeString = @stringify(long);
    }
    else if (strcmp(type, @encode(long long)) == 0) {
        
        typeString = @stringify(long long);
    }
    else if (strcmp(type, @encode(float)) == 0) {
        
        typeString = @stringify(float);
    }
    else if (strcmp(type, @encode(double)) == 0) {
        
        typeString = @stringify(double);
    }
    else if (strcmp(type, @encode(long double)) == 0) {
        
        typeString = @stringify(long double);
    }
    else if (strcmp(type, @encode(BOOL)) == 0) {
        
        typeString = @stringify(BOOL);
    }
    else if (strcmp(type, @encode(bool)) == 0) {
        
        typeString = @stringify(bool);
    }
    else if (strcmp(type, @encode(char)) == 0) {
        
        typeString = @stringify(char);
    }
    else if (strcmp(type, @encode(unsigned short)) == 0) {
        
        typeString = @stringify(unsigned short);
    }
    else if (strcmp(type, @encode(unsigned int)) == 0) {
        
        typeString = @stringify(unsigned int);
    }
    else if (strcmp(type, @encode(unsigned long)) == 0) {
        
        typeString = @stringify(unsigned long);
    }
    else if (strcmp(type, @encode(unsigned long long)) == 0) {
        
        typeString = @stringify(unsigned long long);
    }
    else if (strcmp(type, @encode(unsigned char)) == 0) {
        
        typeString = @stringify(unsigned char);
    }
    else if (strcmp(type, @encode(char *)) == 0) {
        
        typeString = @stringify(char *);
    }
    else if (strcmp(type, @encode(void)) == 0) {
        
        typeString = @stringify(void);
    }
    else if (strcmp(type, @encode(void *)) == 0) {
        
        typeString = @stringify(void *);
    }
    else if (__sp_first_char_for_string(type) == '[' && __sp_last_char_for_string(type) == ']') {
        
        typeString = @stringify(array);
    }
    else if (__sp_first_char_for_string(type) == '{' && __sp_last_char_for_string(type) == '}') {
        
        typeString = @stringify(struct);
    }
    else if (__sp_first_char_for_string(type) == '(' && __sp_last_char_for_string(type) == ')') {
        
        typeString = @stringify(union);
    }
    else if (__sp_first_char_for_string(type) == '^') {
        
        typeString = @stringify(pointer);
    }
    else if (__sp_first_char_for_string(type) == 'b') {
        
        typeString = @stringify(bit_field);
    }
    else if (strcmp(type, "?") == 0) {
        
        typeString = @stringify(unknown_type);
    }
    else {
        typeString = @"Can not distinguish temporarily!😂";
    }
    
    va_end(variable_param_list);
    
    return typeString;
}

//Old Debugger Logging

#if defined(__SP_TRIM_LOG_MACROS__)
#define SPLog(msg, ...)
#define LOG_VIEW(view)
#define FRAME_TO_STRING(frame)
#define RECT_TO_STRING(rect)
#define POINT_TO_STRING(point)
#define SIZE_TO_STRING(size)
#define OBJ_TO_STRING(obj)
#define LOG_FRAME(frame)
#define LOG_RECT(rect)
#define LOG_POINT(point)
#define LOG_SIZE(size)
#define LOG_OBJ(obj)
#define DATA_TO_STR(data, dataEnc)
#define DATA_TO_UTF8_STRING(data)
#define COORDINATE_REGION_TO_STRING(region)
#define COORDINATE_SPAN_TO_STRING(span)
#define MAP_POINT_TO_STRING(mapPoint)
#define MAP_SIZE_TO_STRING(mapSize)
#define LOCATION_COORDINATE_2D_TO_STRING(coordinate)
#define MAP_RECT_TO_STRING(mapRect)
#define LOG_COORDINATE_REGION(region)
#define LOG_COORDINATE_SPAN(span)
#define LOG_MAP_POINT(mapPoint)
#define LOG_MAP_SIZE(mapSize)
#define LOG_LOCATION_COORDINATE_2D(coordinate)
#define LOG_MAP_RECT(mapRect)
#else
#if !defined(SP_LOGGER)
#define SP_LOGGER NSLog
#endif

// Improved log macro
#define SPLog(msg, ...)                                        SP_LOGGER(@"%@|%s|%d> %@", [[self class] description], sel_getName(_cmd), __LINE__, [NSString stringWithFormat:(msg), ##__VA_ARGS__]);

// log view macro
#define LOG_VIEW(view)                                          SP_LOGGER(@"%@", [view recursiveDescription]);

// To string macros
#define FRAME_TO_STRING(frame)                                  [NSString stringWithFormat:@"%f %f %f %f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height]
#define RECT_TO_STRING(rect)                                    FRAME_TO_STRING(rect)
#define POINT_TO_STRING(point)                                  [NSString stringWithFormat:@"%f %f", point.x, point.y]
#define SIZE_TO_STRING(size)                                    [NSString stringWithFormat:@"%f %f", size.width, size.height]
#define OBJ_TO_STRING(obj)                                      [obj description]

// Log macros
#define LOG_FRAME(frame)                                        SP_LOGGER(@"%@", FRAME_TO_STRING(frame))
#define LOG_RECT(rect)                                          SP_LOGGER(@"%@", RECT_TO_STRING(rect))
#define LOG_POINT(point)                                        SP_LOGGER(@"%@", POINT_TO_STRING(point))
#define LOG_SIZE(size)                                          SP_LOGGER(@"%@", SIZE_TO_STRING(size))
#define LOG_OBJ(obj)                                            SP_LOGGER(@"%@", OBJ_TO_STRING(obj))

// Data to String
#define DATA_TO_STR(data, dataEnc)                              SP_LOGGER(@"%@", [[NSString alloc] initWithData:data encoding:dataEnc])

#define DATA_TO_UTF8_STRING(data)                               DATA_TO_STR(data, NSUTF8StringEncoding)

// Map kit
#define COORDINATE_REGION_TO_STRING(region)                     [NSString stringWithFormat:@"%f %f %f %f", region.center.latitude, region.center.longitude, region.span.latitudeDelta, region.span.longitudeDelta]
#define COORDINATE_SPAN_TO_STRING(span)                         [NSString stringWithFormat:@"%f %f", span.latitudeDelta, span.longitudeDelta]
#define MAP_POINT_TO_STRING(mapPoint)                           [NSString stringWithFormat:@"%f %f", mapPoint.x, mapPoint.y]
#define MAP_SIZE_TO_STRING(mapSize)                             [NSString stringWithFormat:@"%f %f", mapSize.width, mapSize.height]
#define LOCATION_COORDINATE_2D_TO_STRING(coordinate)            [NSString stringWithFormat:@"%f %f", coordinate.latitude, coordinate.longitude]
#define MAP_RECT_TO_STRING(mapRect)                             [NSString stringWithFormat:@"%f %f %f %f", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height]

#define LOG_COORDINATE_REGION(region)                           SP_LOGGER(@"%@", COORDINATE_REGION_TO_STRING(region))
#define LOG_COORDINATE_SPAN(span)                               SP_LOGGER(@"%@", COORDINATE_SPAN_TO_STRING(span))
#define LOG_MAP_POINT(mapPoint)                                 SP_LOGGER(@"%@", MAP_POINT_TO_STRING(mapPoint))
#define LOG_MAP_SIZE(mapSize)                                   SP_LOGGER(@"%@", MAP_SIZE_TO_STRING(mapSize))
#define LOG_LOCATION_COORDINATE_2D(coordinate)                  SP_LOGGER(@"%@", LOCATION_COORDINATE_2D_TO_STRING(coordinate))
#define LOG_MAP_RECT(mapRect)                                   SP_LOGGER(@"%@", MAP_RECT_TO_STRING(mapRect))
#endif

#endif /* ConstantLogMacros_h */

/*
 Example
 id obj = self.view;
 SpDBAnyVar(obj);
 
 CGPoint point = CGPointMake(12.34, 56.78);
 SpDBAnyVar(point);
 
 CGSize size = CGSizeMake(87.6, 5.43);
 SpDBAnyVar(size);
 
 CGRect rect = CGRectMake(2.3, 4.5, 5.6, 7.8);
 SpDBAnyVar(rect);
 
 NSRange range = NSMakeRange(3, 56);
 SpDBAnyVar(range);
 
 CGAffineTransform affineTransform = CGAffineTransformMake(1, 2, 3, 4, 5, 6);
 SpDBAnyVar(affineTransform);
 
 UIEdgeInsets edgeInsets = UIEdgeInsetsMake(3, 4, 5, 6);
 SpDBAnyVar(edgeInsets);
 
 SEL sel = @selector(viewDidLoad);
 SpDBAnyVar(sel);
 
 Class class = [UIBarButtonItem class];
 SpDBAnyVar(class);
 
 NSInteger i = 231;
 SpDBAnyVar(i);
 
 CGFloat f = M_E;
 SpDBAnyVar(f);
 
 BOOL b = YES;
 SpDBAnyVar(b);
 
 char c = 'S';
 SpDBAnyVar(c);
 
 CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
 SpDBAnyVar(colorSpaceRef);
 
 //  ......
 
 SpPrintAnything(You can use macro SpPrintAnything() print any without quotation as you want!);
 
 SpPrintf(@"Print format string you customed: %@", SpBox(affineTransform));
 
 NSLog(@"Even use normal NSLog function to print: %@", SpBox(edgeInsets));
 
 SpPrintf(@"The type of obj is %@", SpTypeStringOfVar(obj));
 SpPrintf(@"The type of point is %@", SpTypeStringOfVar(point));
 SpPrintf(@"The type of size is %@", SpTypeStringOfVar(size));
 SpPrintf(@"The type of rect is %@", SpTypeStringOfVar(rect));
 SpPrintf(@"The type of range is %@", SpTypeStringOfVar(range));
 SpPrintf(@"The type of affineTransform is %@", SpTypeStringOfVar(affineTransform));
 SpPrintf(@"The type of edgeInsets is %@", SpTypeStringOfVar(edgeInsets));
 SpPrintf(@"The type of class is %@", SpTypeStringOfVar(class));
 SpPrintf(@"The type of i is %@", SpTypeStringOfVar(i));
 SpPrintf(@"The type of f is %@", SpTypeStringOfVar(f));
 SpPrintf(@"The type of b is %@", SpTypeStringOfVar(b));
 SpPrintf(@"The type of c is %@", SpTypeStringOfVar(c));
 SpPrintf(@"The type of colorSpaceRef is %@", SpTypeStringOfVar(colorSpaceRef));
 
 */

