# iOSFontDemo

A easy demo to show all iOS font.

## DataSource

```
- (NSArray *)fontList
{
    if (!_fontList) {
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSString *familyName in [UIFont familyNames]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:familyName forKey:kFontKeyFamilyName];
            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
            [dict setValue:fontNames forKey:kFontKeyFontNames];
            [mArray addObject:dict];
        }
        _fontList = mArray.copy;
    }
    return _fontList;
}
```

## Screenshots

<p align="center">
<img src="Screenshots/0.gif" width="33%">
</p>


